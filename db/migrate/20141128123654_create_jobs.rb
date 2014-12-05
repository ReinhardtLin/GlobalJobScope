class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :position
      t.string :employer
      t.integer :number
      t.date :deadline

      t.integer :salary_min, :null => false, :default => 0
      t.integer :salary_max, :null => false, :default => 0
      t.string :currency, :null => false, :default => 'USD'

      t.text :requirement
      t.text :responsibility
      t.text :benefit
      t.text :company_profile
      t.text :suggestion

      t.timestamps
    end
    add_index :jobs, :user_id
  end
end
