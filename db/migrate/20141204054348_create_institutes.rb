class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.integer :education_id
      t.string :name

      t.timestamps
    end
    add_column :educations, :institute_id, :integer
    add_index :educations, :institute_id
  end
end
