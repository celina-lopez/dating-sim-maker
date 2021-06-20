class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.belongs_to :chapter, null: false, index: true
      t.text :text, null: false
      t.integer :speakeable_id, null: false
      t.integer :order, null: false
      t.integer :line_type, null: false, default: 0
      t.integer :emotion, null: false, default: 0
      t.timestamps
    end
  end
end
