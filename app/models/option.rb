# == Schema Information
#
# Table name: options
#
#  id         :bigint           not null, primary key
#  answers    :string           default([]), not null, is an Array
#  weights    :integer          default([]), not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  line_id    :bigint           not null
#
# Indexes
#
#  index_options_on_line_id  (line_id)
#
class Option < ApplicationRecord
  OPTIONS = [:option_1, :option_2, :option_3]
  WEIGHTS = [:weight_1, :weight_2, :weight_3]
  attr_accessor(*OPTIONS, *WEIGHTS)

  validates_uniqueness_of :line_id
  belongs_to :line
end
