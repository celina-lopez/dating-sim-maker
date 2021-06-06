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
class Chapter < ApplicationRecord
  validates_uniqueness_of :order_number, scope: [:chap_type, :story_id]

  belongs_to :story
  has_many :lines

  enum chap_type: {
  	default: 0,
  	ending: 1,
  }

  enum status: {
  	draft: 0,
  	publish: 1,
  }

end
