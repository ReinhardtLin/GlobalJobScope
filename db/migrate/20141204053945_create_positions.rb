class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :job_id
      t.integer :experience_id
      t.string :name

      t.timestamps
    end
    add_column :jobs, :position_id, :integer
    add_index :jobs, :position_id
    add_column :experiences, :position_id, :integer
    add_index :experiences, :position_id
  end
end
