class CreateSubmissions < ActiveRecord::Migration
  def change

    create_table :submissions do |t|
      t.string :aasm_state, :default => "applying"
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
    add_column :jobs, :submission_id, :integer
    add_index :jobs, :submission_id
    add_column :users, :submission_id, :integer
    add_index :users, :submission_id
  end
end
