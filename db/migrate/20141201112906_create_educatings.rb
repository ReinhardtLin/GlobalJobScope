class CreateEducatings < ActiveRecord::Migration
  def change
    create_table :educatings do |t|
      t.belongs_to :education, index: true
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
