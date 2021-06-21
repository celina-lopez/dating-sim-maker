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
require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
