class CreateStayings < ActiveRecord::Migration
  def change
    create_table :stayings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
