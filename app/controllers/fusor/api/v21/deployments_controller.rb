class Fusor::Api::V21::DeploymentsController < ApplicationController
  before_action :set_deployment, only: [:show, :update, :destroy]

  # GET /deployments
  def index
    @deployments = Deployment.all

    render json: {'deployments': @deployments}
  end

  # GET /deployments/1
  def show
    render json: {'deployment': @deployment}
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
      render json: @deployment
    else
      render json: @deployment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deployments/1
  def destroy
    @deployment.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_deployment
    @deployment = Deployment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def deployment_params
    params.fetch(:deployment, {}).permit(:name, :lifecycle_environment_id, :organization_id, :deploy_rhev, :deploy_cfme, :deploy_openstack, :rhev_engine_host_id, :rhev_data_center_name, :rhev_cluster_name, :rhev_storage_name, :rhev_storage_type, :rhev_storage_address, :rhev_cpu_type, :rhev_share_path, :cfme_install_loc, :description, :rhev_is_self_hosted, :rhev_engine_admin_password, :foreman_task_uuid, :upstream_consumer_uuid, :rhev_root_password, :cfme_root_password, :upstream_consumer_name, :rhev_export_domain_name, :rhev_export_domain_address, :rhev_export_domain_path, :rhev_local_storage_path, :host_naming_scheme, :custom_preprend_name, :enable_access_insights, :cfme_admin_password, :cdn_url, :manifest_file, :is_disconnected, :label, :deploy_openshift, :openshift_install_loc, :openshift_storage_size, :openshift_username, :openshift_master_vcpu, :openshift_master_ram, :openshift_master_disk, :openshift_node_vcpu, :openshift_node_ram, :openshift_node_disk, :openshift_available_vcpu, :openshift_available_ram, :openshift_available_disk, :openshift_number_master_nodes, :openshift_number_worker_nodes, :openshift_storage_type, :openshift_export_path, :cloudforms_vcpu, :cloudforms_ram, :cloudforms_vm_disk_size, :cloudforms_db_disk_size, :has_content_error, :openshift_subdomain_name, :ose_public_key_path, :ose_private_key_path, :openshift_user_password, :openshift_root_password, :openshift_storage_host, :hosted_storage_name, :hosted_storage_type, :hosted_storage_address, :hosted_storage_path, :openstack_deployment_id, :cfme_db_password, :openshift_sample_helloworld, :rhev_self_hosted_engine_hostname, :cfme_rhv_address, :cfme_rhv_hostname, :cfme_osp_address, :cfme_osp_hostname, :ssh_public_key, :ssh_private_key)
  end
end
