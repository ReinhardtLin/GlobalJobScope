class CreateCurrents < ActiveRecord::Migration
  def change
    create_table :currents do |t|
      t.integer :experience_id
      t.integer :education_id
      t.string :name

      t.timestamps
    end
    add_column :experiences, :current_id, :integer
    add_column :educations, :current_id, :integer
    add_index :experiences, :current_id
    add_index :educations, :current_id
  end
end
