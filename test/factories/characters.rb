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
FactoryBot.define do
  factory :character do
    
  end
end