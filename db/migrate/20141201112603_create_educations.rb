class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :user_id
      t.string :degree
      t.string :institute
      t.date :from
      t.date :to
      t.text :description

      t.timestamps
    end
    add_index :educations, :user_id
  end
end
