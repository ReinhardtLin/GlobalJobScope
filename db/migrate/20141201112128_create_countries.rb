class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :countries, :user_id
  end
end
