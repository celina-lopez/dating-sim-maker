# == Schema Information
#
# Table name: characters
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  personality_id :bigint           not null
#
# Indexes
#
#  index_characters_on_personality_id  (personality_id)
#
class Character < ApplicationRecord
  belongs_to :personality
  validates_uniqueness_of :personality_id

  has_one :relationship
end
