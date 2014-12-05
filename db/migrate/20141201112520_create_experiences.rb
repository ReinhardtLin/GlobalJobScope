class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :position
      t.string :employer
      t.integer :salary, :null => false, :default => 0
      t.date :from
      t.date :to
      t.text :description

      t.timestamps
    end
    add_index :experiences, :user_id
  end
end
