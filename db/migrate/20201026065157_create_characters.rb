class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.text :biography
      t.belongs_to :user, null: false
      t.jsonb :details, null: false
      t.jsonb :emotions

      t.timestamps
    end
  end
end
