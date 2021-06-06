class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.belongs_to :chapter, null: false, index: true
      t.text :question, null: false
      t.integer :order, null: false
      t.string :answers, array: true, default: [], null: false
      t.integer :weights, array: true, default: [], null: false
      t.integer :emotion, null: false, default: 0

      t.timestamps
    end
  end
end
