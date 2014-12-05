class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.integer :job_id
      t.integer :experience_id
      t.string :name

      t.timestamps
    end
    add_column :jobs, :employer_id, :integer
    add_index :jobs, :employer_id
    add_column :experiences, :employer_id, :integer
    add_index :experiences, :employer_id
  end
end
