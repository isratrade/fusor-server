class DeploymentHost < ActiveRecord::Base

    belongs_to :deployment, :class_name => "Fusor::Deployment"

    # if we want to enforce discovered host uniqueness uncomment this line
    #validates :discovered_host_id, uniqueness: { :message => _('This Host is already an RHV Hypervisor for a different deployment') }

end
