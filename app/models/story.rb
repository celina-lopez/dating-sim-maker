# == Schema Information
#
# Table name: stories
#
#  id          :bigint           not null, primary key
#  description :text
#  status      :integer          default("draft"), not null
#  title       :string           not null
#  uid         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_stories_on_user_id  (user_id)
#
class Story < ApplicationRecord
  belongs_to :user
  has_many :chapters

  has_many :storycharacters
  has_many :characters, through: :storycharacters

  validates_uniqueness_of :uid
  before_save :rand_uid

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

  def rand_uid
    all_array = ("A"..."Z").to_a + (1..9).to_a.map { |c| c.to_s }
    all_array.delete("I")
    all_array.delete("O")
    self.uid = (0..6).map { |i| all_array.sample }.join
  end
end
