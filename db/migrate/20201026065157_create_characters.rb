class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.text :biography
      t.belongs_to :story, null: false, index: true 

      t.timestamps
    end
  end
end
