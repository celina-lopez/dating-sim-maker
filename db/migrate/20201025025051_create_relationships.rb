class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :character, null: false, index: true
      t.belongs_to :user, null:false, index: true

      t.timestamps
    end
  end
end
