class CreateDeploymentHosts < ActiveRecord::Migration
  def change
    create_table :deployment_hosts do |t|
      t.integer :deployment_id,      :null => false
      t.integer :discovered_host_id, :null => false
      t.string  :deployment_host_type, :null => false, :default => "rhev_hypervisor"
      t.timestamps
    end
  end
end
