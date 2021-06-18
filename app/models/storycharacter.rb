# == Schema Information
#
# Table name: storycharacters
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :bigint           not null
#  story_id     :bigint           not null
#
# Indexes
#
#  index_storycharacters_on_character_id  (character_id)
#  index_storycharacters_on_story_id      (story_id)
#
class Storycharacter < ApplicationRecord
  belongs_to :character
  belongs_to :story

  validates_uniqueness_of :character_id, scope: [:story_id]
end
