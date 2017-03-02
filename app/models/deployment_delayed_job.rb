class DeploymentDelayedJob < ActiveRecord::Base
  belongs_to :deployment
  belongs_to :delayed_job
end
