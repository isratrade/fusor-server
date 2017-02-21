#
# Copyright 2015 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

# require "net/http"
# require "sys/filesystem"
# require "uri"
# require "json"
# require 'fusor/password_filter'
# require 'fusor/deployment_logger'

class Fusor::Api::V21::DeploymentsController < ApplicationController
  before_action :set_deployment, only: [:show,
                                        :update, :destroy,
                                        :check_mount_point,
                                        :deploy,
                                        :redeploy,
                                        :validate,
                                        :log,
                                        :openshift_disk_space,
                                        :compatible_cpu_families]

  include Fusor::Api::V21::DiscoveredHostsMixin
  include Fusor::Api::V21::OrganizationsMixin
  include Fusor::Api::V21::LifecycleEnvironmentsMixin

  # GET /deployments
  def index
    @deployments = Deployment.search_for(params[:search], :order => params[:order]).by_id(params[:id])
                              .paginate(:page => params[:page])
    cnt_search = Deployment.search_for(params[:search], :order => params[:order]).count

    connection = Faraday.new SATELLITE_URL do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
      conn.basic_auth API_USERNAME, API_PASSWORD
    end

    render json: {deployments: @deployments.as_json(methods: [
                                  :discovered_host_ids
                                  ]),
                 organizations: get_organizations,
                 lifecycle_environments: get_lifecycle_environments,
                 discovered_hosts: get_discovered_hosts,
                 meta: {
                   total: cnt_search,
                   page: params[:page].present? ? params[:page].to_i : 1,
                   total_pages: (cnt_search / 20.0).ceil
                 }
               }
  end

  # GET /deployments/1
  def show
    render json: {deployment: @deployment,
                  organizations: get_organizations,
                  lifecycle_environments: get_lifecycle_environments,
                  discovered_hosts: get_discovered_hosts
                  }
  end

  # POST /deployments
  def create
    @deployment = Deployment.new(deployment_params)

    if @deployment.save
      render json: @deployment, status: :created , root: "deployment", adapter: :json

    else
      render json: @deployment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deployments/1
  def update
    if @deployment.update(deployment_params)
      render json: @deployment, root: "deployment", adapter: :json
    else
      render json: @deployment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deployments/1
  def destroy
    @deployment.destroy
  end

  def compatible_cpu_families
    # rhv_hypervisors = @deployment.discovered_hosts
    # cpu_families = Utils::Fusor::CpuCompatDetector.rhv_cpu_families(rhv_hypervisors)
    render json: {}, status: 200
  end

  def check_mount_point
    mount_address = params['address']
    mount_path = params['path']
    mount_type = params['type']
    mount_unique_suffix = params['unique_suffix']

    begin
      mount_result = mount_storage(mount_address, mount_path, mount_type, mount_unique_suffix)
      render json: { :mounted => true, :is_empty => mount_result[:is_empty] }, status: 200
    rescue
      render json: { :mounted => false, :is_empty => false }, status: 200
    end
  end

  # mount_storage will return in megabytes the amount of free space left on the storage mount
  def mount_storage(address, path, type, unique_suffix)
    # deployment_id = @deployment.id
    # if type.downcase.include?('gfs') || type.downcase.include?('glusterfs')
    #   type = "glusterfs"
    # else
    #   type = "nfs"
    # end

    # cmd = "sudo safe-mount.sh '#{deployment_id}' '#{unique_suffix}' '#{address}' '#{path}' '#{type}'"
    # status, _output = Utils::Fusor::CommandUtils.run_command(cmd)

    # raise 'Unable to mount NFS share at specified mount point' unless status == 0

    # files = Dir["/tmp/fusor-test-mount-#{deployment_id}-#{unique_suffix}/*"]

    # stats = Sys::Filesystem.stat("/tmp/fusor-test-mount-#{deployment_id}-#{unique_suffix}")
    mb_available = 100 #stats.block_size * stats.blocks_available / 1024 / 1024

    # Utils::Fusor::CommandUtils.run_command("sudo safe-umount.sh #{deployment_id} #{unique_suffix}")
    return {
      :mb_available => mb_available,
      :is_empty => true #files.size == 0
    }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_deployment
    @deployment = Deployment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def deployment_params
    params.fetch(:deployment, {}).permit(:name,
      :lifecycle_environment_id, :organization_id,
      :deploy_rhev, :deploy_cfme, :deploy_openstack,
      :rhev_engine_host_id,
      :rhev_data_center_name, :rhev_cluster_name,
      :rhev_storage_name, :rhev_storage_type,
      :rhev_storage_address, :rhev_cpu_type, :rhev_share_path,
      :cfme_install_loc, :description,
      :rhev_is_self_hosted, :rhev_engine_admin_password,
      :foreman_task_uuid, :upstream_consumer_uuid, :rhev_root_password,
      :cfme_root_password, :upstream_consumer_name,
      :rhev_export_domain_name, :rhev_export_domain_address,
      :rhev_export_domain_path, :rhev_local_storage_path,
      :host_naming_scheme, :custom_preprend_name,
      :enable_access_insights, :cfme_admin_password,
      :cdn_url, :manifest_file, :is_disconnected, :label,
      :deploy_openshift, :openshift_install_loc,
      :openshift_storage_size, :openshift_username,
      :openshift_master_vcpu, :openshift_master_ram,
      :openshift_master_disk, :openshift_node_vcpu,
      :openshift_node_ram, :openshift_node_disk,
      :openshift_available_vcpu, :openshift_available_ram,
      :openshift_available_disk, :openshift_number_master_nodes,
      :openshift_number_worker_nodes, :openshift_storage_type,
      :openshift_export_path, :cloudforms_vcpu, :cloudforms_ram,
      :cloudforms_vm_disk_size, :cloudforms_db_disk_size,
      :has_content_error, :openshift_subdomain_name,
      :ose_public_key_path, :ose_private_key_path,
      :openshift_user_password, :openshift_root_password,
      :openshift_storage_host, :hosted_storage_name,
      :hosted_storage_type, :hosted_storage_address,
      :hosted_storage_path, :openstack_deployment_id,
      :cfme_db_password, :openshift_sample_helloworld,
      :rhev_self_hosted_engine_hostname, :cfme_rhv_address,
      :cfme_rhv_hostname, :cfme_osp_address, :cfme_osp_hostname,
      :ssh_public_key, :ssh_private_key)
  end
end


