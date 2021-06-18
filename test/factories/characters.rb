# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  biography  :text
#  details    :jsonb            not null
#  emotions   :jsonb
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#
FactoryBot.define do
  factory :character do
    
  end
end
