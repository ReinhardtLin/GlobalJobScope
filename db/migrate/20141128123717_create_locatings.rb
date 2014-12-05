class CreateLocatings < ActiveRecord::Migration
  def change
    create_table :locatings do |t|
      t.belongs_to :job, index: true
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
