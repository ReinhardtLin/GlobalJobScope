class AddStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :aasm_state, :string, :default => 'open'
  end
end
