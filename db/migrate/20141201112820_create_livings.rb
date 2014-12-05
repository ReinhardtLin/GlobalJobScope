class CreateLivings < ActiveRecord::Migration
  def change
    create_table :livings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
