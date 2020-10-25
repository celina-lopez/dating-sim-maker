# == Schema Information
#
# Table name: characters
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  personality_id :bigint           not null
#
# Indexes
#
#  index_characters_on_personality_id  (personality_id)
#
require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
