class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.belongs_to :story, null: false, index: true
      t.integer :order_number, null: false
      t.integer :status, null: false, default: 0
      t.integer :chap_type, null: false, default: 0
      t.string :title, null: false
      t.integer :love_meter_ending_condition
      t.string :background_image_url

      t.timestamps
    end
  end
end
