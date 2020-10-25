# == Schema Information
#
# Table name: characters
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  story_id    :bigint           not null
#
# Indexes
#
#  index_characters_on_story_id  (story_id)
#
class Character < ApplicationRecord
  validates_uniqueness_of :personality_id

  has_one :relationship
  has_one :personality, as: :object_personality

  belongs_to :story
end
