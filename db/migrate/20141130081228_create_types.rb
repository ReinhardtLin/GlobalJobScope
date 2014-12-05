class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.integer :job_id
      t.string :name

      t.timestamps
    end
    add_column :jobs, :type_id, :integer
    add_index :jobs, :type_id
  end
end
