class CreateMajorings < ActiveRecord::Migration
  def change
    create_table :majorings do |t|
      t.belongs_to :education, index: true
      t.belongs_to :profession, index: true

      t.timestamps
    end
  end
end
