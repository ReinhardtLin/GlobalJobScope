class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :job_id
  end
end
