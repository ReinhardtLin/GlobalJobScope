class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :languages, :user_id
  end
end
