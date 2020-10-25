# == Schema Information
#
# Table name: stories
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Story < ApplicationRecord
  has_many :characters
end
