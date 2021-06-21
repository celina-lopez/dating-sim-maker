# == Schema Information
#
# Table name: chapters
#
#  id                   :bigint           not null, primary key
#  background_image_url :string
#  chap_type            :integer          default("default"), not null
#  character_condition  :integer
#  character_ending     :integer
#  order_number         :integer          not null
#  status               :integer          default("draft"), not null
#  title                :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  story_id             :bigint           not null
#
# Indexes
#
#  index_chapters_on_story_id  (story_id)
#
class Chapter < ApplicationRecord
  validates_uniqueness_of :order_number, scope: [:chap_type, :story_id]

  belongs_to :story
  has_many :lines
  has_many :options

  enum chap_type: {
  	default: 0,
    progress_ending: 1,
  	character_ending: 2,
  }

  # character_ending
  # character_condition

  enum status: {
  	draft: 0,
  	publish: 1,
  }

  def self.ending_types
    chap_types.keys.select { |x| x.include?("ending") }
  end
end
