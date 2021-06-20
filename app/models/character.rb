# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  biography  :text
#  details    :jsonb            not null
#  emotions   :jsonb
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#
class Character < ApplicationRecord
  EMOTIONS = {
  	default: "far fa-smile",
  	happy: "far fa-grin-beam",
  	suspicious: "far fa-flushed",
  	sad: "far fa-sad-cry",
  	mad: "far fa-angry",
  	flirt: "far fa-grin-hearts",
  	confused: "far fa-flushed",
  }
  DETAILS = [:zodiac_sign, :height, :likes]

  attr_accessor(*DETAILS, *EMOTIONS.keys, :story_id)

  belongs_to :user

  has_many :storycharacters
  has_many :stories, through: :storycharacters

  ZODIAC_SIGNS = [
  	"Aquarius",
  	"Pisces",
  	"Aries",
  	"Taurus",
  	"Gemini",
  	"Cancer",
  	"Leo",
  	"Virgo",
  	"Libra",
  	"Scorpio",
  	"Sagittarius",
  	"Capricorn",
  ]
end
