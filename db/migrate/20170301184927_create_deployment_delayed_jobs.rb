class CreateDeploymentDelayedJobs < ActiveRecord::Migration
  def change
    create_table :deployment_delayed_jobs do |t|
      t.integer :run_number
      t.references :deployment, index: true
      t.references :delayed_job, index: true

      t.timestamps null: false
    end
    add_foreign_key :deployment_delayed_jobs, :deployments

    # no delayed_jobs foreign key because successful jobs get deleted by the the delayed_job process
    # running in the background and would fail due to foreign key constraints.
    # add_foreign_key :deployment_delayed_jobs, :delayed_jobs
  end
end
