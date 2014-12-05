class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.belongs_to :user, index: true
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
