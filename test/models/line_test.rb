# == Schema Information
#
# Table name: lines
#
#  id            :bigint           not null, primary key
#  emotion       :integer          default("default"), not null
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
require 'test_helper'

class LineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
