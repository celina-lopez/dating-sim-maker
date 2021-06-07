# == Schema Information
#
# Table name: lines
#
#  id            :bigint           not null, primary key
#  emotion       :integer          default(0), not null
#  line_type     :integer          default("chapter"), not null
#  order         :integer          not null
#  speakeable    :string           not null
#  text          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  chapter_id    :bigint           not null
#  option_id     :integer
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

  enum emotion: {
  	default: 0,
  }

  belongs_to :option, optional: true
  belongs_to :chapter


  def speaker_name
    if speakeable_id == 0
      "MC"
    else
      Character.find(speakeable_id).name
    end
  end
end
