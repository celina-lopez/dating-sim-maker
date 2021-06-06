class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.text :description
      t.belongs_to :user, null: false, index: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
