class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_column :users, :gender_id, :integer
    add_index :users, :gender_id
  end
end
