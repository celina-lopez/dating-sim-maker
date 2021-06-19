class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.belongs_to :line, null: false, index: true
      t.string :answers, array: true, default: [], null: false
      t.integer :weights, array: true, default: [], null: false

      t.timestamps
    end
  end
end
