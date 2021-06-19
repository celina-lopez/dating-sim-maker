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
FactoryBot.define do
  factory :option do
    
  end
end
