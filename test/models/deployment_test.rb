# == Schema Information
#
# Table name: deployments
#
#  id                               :integer          not null, primary key
#  name                             :string
#  lifecycle_environment_id         :integer
#  organization_id                  :integer
#  deploy_rhev                      :boolean          default("false")
#  deploy_cfme                      :boolean          default("false")
#  deploy_openstack                 :boolean          default("false")
#  rhev_engine_host_id              :integer
#  rhev_data_center_name            :string
#  rhev_cluster_name                :string
#  rhev_storage_name                :string
#  rhev_storage_type                :string
#  rhev_storage_address             :string
#  rhev_cpu_type                    :string
#  rhev_share_path                  :string
#  cfme_install_loc                 :string
#  description                      :text
#  rhev_is_self_hosted              :boolean          default("false")
#  rhev_engine_admin_password       :string
#  foreman_task_uuid                :string
#  upstream_consumer_uuid           :string
#  rhev_root_password               :string
#  cfme_root_password               :string
#  upstream_consumer_name           :string
#  rhev_export_domain_name          :string
#  rhev_export_domain_address       :string
#  rhev_export_domain_path          :string
#  rhev_local_storage_path          :string
#  host_naming_scheme               :string
#  custom_preprend_name             :string
#  enable_access_insights           :boolean          default("false")
#  cfme_admin_password              :string
#  cdn_url                          :string
#  manifest_file                    :string
#  is_disconnected                  :boolean
#  label                            :string
#  deploy_openshift                 :boolean          default("false")
#  openshift_install_loc            :string
#  openshift_storage_size           :integer          default("0")
#  openshift_username               :string
#  openshift_master_vcpu            :integer          default("0")
#  openshift_master_ram             :integer          default("0")
#  openshift_master_disk            :integer          default("0")
#  openshift_node_vcpu              :integer          default("0")
#  openshift_node_ram               :integer          default("0")
#  openshift_node_disk              :integer          default("0")
#  openshift_available_vcpu         :integer          default("0")
#  openshift_available_ram          :integer          default("0")
#  openshift_available_disk         :integer          default("0")
#  openshift_number_master_nodes    :integer          default("0")
#  openshift_number_worker_nodes    :integer          default("0")
#  openshift_storage_type           :string
#  openshift_export_path            :string
#  cloudforms_vcpu                  :integer          default("0")
#  cloudforms_ram                   :integer          default("0")
#  cloudforms_vm_disk_size          :integer          default("0")
#  cloudforms_db_disk_size          :integer          default("0")
#  has_content_error                :boolean
#  openshift_subdomain_name         :string
#  ose_public_key_path              :string
#  ose_private_key_path             :string
#  openshift_user_password          :string
#  openshift_root_password          :string
#  openshift_storage_host           :string
#  hosted_storage_name              :string
#  hosted_storage_type              :string
#  hosted_storage_address           :string
#  hosted_storage_path              :string
#  openstack_deployment_id          :integer
#  cfme_db_password                 :string
#  openshift_sample_helloworld      :boolean          default("false")
#  rhev_self_hosted_engine_hostname :string
#  cfme_rhv_address                 :string
#  cfme_rhv_hostname                :string
#  cfme_osp_address                 :string
#  cfme_osp_hostname                :string
#  ssh_public_key                   :text
#  ssh_private_key                  :text
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

require 'test_helper'

class DeploymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
