# == Schema Information
#
# Table name: chapters
#
#  id           :bigint           not null, primary key
#  chap_type    :integer          default("default"), not null
#  order_number :integer          not null
#  status       :integer          default("draft"), not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  story_id     :bigint           not null
#
# Indexes
#
#  index_chapters_on_story_id  (story_id)
#
FactoryBot.define do
  factory :chapter do
    
  end
end
