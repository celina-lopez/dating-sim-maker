# == Schema Information
#
# Table name: options
#
#  id         :bigint           not null, primary key
#  answers    :string           default([]), not null, is an Array
#  emotion    :integer          default(0), not null
#  order      :integer          not null
#  question   :text             not null
#  weights    :integer          default([]), not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chapter_id :bigint           not null
#
# Indexes
#
#  index_options_on_chapter_id  (chapter_id)
#
class Option < ApplicationRecord
  belongs_to :speakeable, polymorphic: true

  validates_uniqueness_of :order, scope: :chapter_id

  enum type: {
  	chapter: 0,
  	option: 1,
  }

  belongs_to :option, optional: true
end
