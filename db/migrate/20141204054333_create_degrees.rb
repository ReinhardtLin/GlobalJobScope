class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.integer :education_id
      t.string :name

      t.timestamps
    end
    add_column :educations, :degree_id, :integer
    add_index :educations, :degree_id
  end
end
