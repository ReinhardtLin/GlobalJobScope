class CreateAddFollowsCountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :follows_count, :integer, :default => 0
    add_column :jobs, :comments_count, :integer, :default => 0

    create_table :add_follows_count_to_jobs do |t|

      t.timestamps
    end
  end
end
