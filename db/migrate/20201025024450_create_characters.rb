class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.belongs_to :personality, null: false, index: true, unique: true
      t.text :description

      t.timestamps
    end
  end
end
