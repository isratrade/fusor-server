class Fusor::Api::V21::SettingsController < ApplicationController

  def index
    render json: {error: 'incorrect route. Try adding /openshift or /cloudforms'}
  end

  def cloudforms
    #TODO - DRY this up
    render json: {settings: [{
      name: "cloudforms_db_disk_size",
      value: SETTINGS[:fusor][:defaults][:cloudforms_db_disk_size],
      category: "Setting::Cloudforms"
      },
      {
      name: "cloudforms_ram",
      value: SETTINGS[:fusor][:defaults][:cloudforms_ram],
      category: "Setting::Cloudforms"
      },
      {
      name: "cloudforms_vcpu",
      value: SETTINGS[:fusor][:defaults][:cloudforms_vcpu],
      category: "Setting::Cloudforms"
      },
      {
      name: "cloudforms_vm_disk_size",
      value: SETTINGS[:fusor][:defaults][:cloudforms_vm_disk_size],
      category: "Setting::Cloudforms"
      }
    ]
    }
  end

  def openshift
    render json: {settings: [{
      name: "openshift_master_disk",
      value: SETTINGS[:fusor][:defaults][:openshift_master_disk],
      category: "Setting::Openshift"
      },
      {
      name: "openshift_master_ram",
      value: SETTINGS[:fusor][:defaults][:openshift_master_ram],
      category: "Setting::Openshift"
      },
      {
      name: "openshift_master_vcpu",
      value: SETTINGS[:fusor][:defaults][:openshift_master_vcpu],
      category: "Setting::Openshift"
      },
      {
      name: "openshift_node_disk",
      value: SETTINGS[:fusor][:defaults][:openshift_node_disk],
      category: "Setting::Openshift"
      },
      {
      name: "openshift_node_ram",
      value: SETTINGS[:fusor][:defaults][:openshift_node_ram],
      category: "Setting::Openshift"
      },
      {
      name: "openshift_node_vcpu",
      value: SETTINGS[:fusor][:defaults][:openshift_node_vcpu],
      category: "Setting::Openshift"
      }
    ]
    }
  end

end
