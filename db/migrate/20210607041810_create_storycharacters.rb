class CreateStorycharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :storycharacters do |t|
      t.belongs_to :story, null: false
      t.belongs_to :character, null: false

      t.timestamps
    end
  end
end
