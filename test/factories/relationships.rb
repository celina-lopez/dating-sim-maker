# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  progress     :float            default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_relationships_on_character_id  (character_id)
#  index_relationships_on_user_id       (user_id)
#
FactoryBot.define do
  factory :relationship do
    
  end
end
