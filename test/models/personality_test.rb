# == Schema Information
#
# Table name: personalities
#
#  id                   :bigint           not null, primary key
#  acts_of_service      :float            default(0.2), not null
#  physicial_touch      :float            default(0.2), not null
#  quality_time         :float            default(0.2), not null
#  receiving_gifts      :float            default(0.2), not null
#  words_of_affirmation :float            default(0.2), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  object_id            :integer          not null
#
require 'test_helper'

class PersonalityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
