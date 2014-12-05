class CreateWorkings < ActiveRecord::Migration
  def change
    create_table :workings do |t|
      t.belongs_to :experience, index: true
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
