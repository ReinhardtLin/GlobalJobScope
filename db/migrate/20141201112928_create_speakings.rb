class CreateSpeakings < ActiveRecord::Migration
  def change
    create_table :speakings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :language, index: true
      t.integer :user_id
      t.integer :language_id
      t.string :name

      t.timestamps
    end
    add_index :languages, :speaking_id
  end
end
