class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.string :name
      t.string "name"#, null: false
      t.integer "lifecycle_environment_id"
      t.integer "organization_id"#,null: false
      t.boolean "deploy_rhev", default: false
      t.boolean "deploy_cfme", default: false
      t.boolean "deploy_openstack", default: false
      t.integer "rhev_engine_host_id"
      t.string "rhev_data_center_name"
      t.string "rhev_cluster_name"
      t.string "rhev_storage_name"
      t.string "rhev_storage_type"
      t.string "rhev_storage_address"
      t.string "rhev_cpu_type"
      t.string "rhev_share_path"
      t.string "cfme_install_loc"
      t.text "description"
      t.boolean "rhev_is_self_hosted", default: false
      t.string "rhev_engine_admin_password"
      t.string "foreman_task_uuid"
      t.string "upstream_consumer_uuid"
      t.string "rhev_root_password"
      t.string "cfme_root_password"
      t.string "upstream_consumer_name"
      t.string "rhev_export_domain_name"
      t.string "rhev_export_domain_address"
      t.string "rhev_export_domain_path"
      t.string "rhev_local_storage_path"
      t.string "host_naming_scheme"
      t.string "custom_preprend_name"
      t.boolean "enable_access_insights", default: false
      t.string "cfme_admin_password"
      t.string "cdn_url"
      t.string "manifest_file"
      t.boolean "is_disconnected"
      t.string "label"
      t.boolean "deploy_openshift", default: false
      t.string "openshift_install_loc"
      t.integer "openshift_storage_size", default: 0
      t.string "openshift_username"
      t.integer "openshift_master_vcpu", default: 0
      t.integer "openshift_master_ram", default: 0
      t.integer "openshift_master_disk", default: 0
      t.integer "openshift_node_vcpu", default: 0
      t.integer "openshift_node_ram", default: 0
      t.integer "openshift_node_disk", default: 0
      t.integer "openshift_available_vcpu", default: 0
      t.integer "openshift_available_ram", default: 0
      t.integer "openshift_available_disk", default: 0
      t.integer "openshift_number_master_nodes", default: 0
      t.integer "openshift_number_worker_nodes", default: 0
      t.string "openshift_storage_type"
      t.string "openshift_export_path"
      t.integer "cloudforms_vcpu", default: 0
      t.integer "cloudforms_ram", default: 0
      t.integer "cloudforms_vm_disk_size", default: 0
      t.integer "cloudforms_db_disk_size", default: 0
      t.boolean "has_content_error"
      t.string "openshift_subdomain_name"
      t.string "ose_public_key_path"
      t.string "ose_private_key_path"
      t.string "openshift_user_password"
      t.string "openshift_root_password"
      t.string "openshift_storage_host"
      t.string "hosted_storage_name"
      t.string "hosted_storage_type"
      t.string "hosted_storage_address"
      t.string "hosted_storage_path"
      t.integer "openstack_deployment_id"
      t.string "cfme_db_password"
      t.boolean "openshift_sample_helloworld", default: false#,null: false
      t.string "rhev_self_hosted_engine_hostname"
      t.string "cfme_rhv_address"
      t.string "cfme_rhv_hostname"
      t.string "cfme_osp_address"
      t.string "cfme_osp_hostname"
      t.text "ssh_public_key"
      t.text "ssh_private_key"

      t.timestamps null: false
    end
  end
end
