# == Schema Information
#
# Table name: stories
#
#  id          :bigint           not null, primary key
#  description :text
#  status      :integer          default("draft"), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_stories_on_user_id  (user_id)
#
class Story < ApplicationRecord
  has_many :characters
  belongs_to :user
  has_many :chapters

  enum status: {
    draft: 0,
    published: 1,
  }

  def mini_description
    max_size = 100
    if description.size > max_size
      "#{description[0..100]}..."
    else
      description 
    end
  end
end
