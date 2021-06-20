# == Schema Information
#
# Table name: lines
#
#  id            :bigint           not null, primary key
#  emotion       :integer          default("default"), not null
#  line_type     :integer          default("chapter"), not null
#  order         :integer          not null
#  text          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  chapter_id    :bigint           not null
#  speakeable_id :integer          not null
#
# Indexes
#
#  index_lines_on_chapter_id  (chapter_id)
#
class Line < ApplicationRecord
  validates_uniqueness_of :order, scope: :chapter_id

  enum line_type: {
  	chapter: 0,
  	option: 1,
  }

  EMOTIONS = Character::EMOTIONS.keys.each_with_object({}).with_index do |(el, acc), index|
    acc[el] = index
  end
  enum emotion: EMOTIONS

  has_one :option
  belongs_to :chapter

  def mc?
    speakeable_id == 0
  end

  def speaker_name
    if mc?
      "MC"
    else
      Character.find(speakeable_id).name
    end
  end
end
