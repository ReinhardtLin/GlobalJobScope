class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :job_id
      t.integer :user_id
      t.integer :experience_id
      t.integer :education_id
      t.string :name

      t.timestamps
    end
    add_index :locations, :job_id
    add_index :locations, :user_id
    add_index :locations, :experience_id
    add_index :locations, :education_id
  end
end
