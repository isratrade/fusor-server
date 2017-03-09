class AddHostNameToDeploymentHosts < ActiveRecord::Migration
  def change
    add_column :deployment_hosts, :host_name, :string
  end
end
