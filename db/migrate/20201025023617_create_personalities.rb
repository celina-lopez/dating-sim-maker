class CreatePersonalities < ActiveRecord::Migration[6.0]
  def change
    create_table :personalities do |t|
      t.string :name
      t.float :words_of_affirmation, null: false, default: 0.2
      t.float :quality_time, null: false, default: 0.2
      t.float :acts_of_service, null: false, default: 0.2
      t.float :receiving_gifts, null: false, default: 0.2
      t.float :physicial_touch, null: false, default: 0.2
      t.integer :object_id, null: false
      t.string :object_type, null: false

      t.timestamps
    end
  end
end
