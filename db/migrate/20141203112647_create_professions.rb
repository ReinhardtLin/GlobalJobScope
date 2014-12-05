class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.integer :education_id
      t.string :name

      t.timestamps
    end
    add_index :professions, :education_id
  end
end
