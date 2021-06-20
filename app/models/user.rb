# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  encrypted_password    :string           not null
#  encrypted_password_iv :string           not null
#  name                  :string
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class User < ApplicationRecord
  validates_uniqueness_of :username

  # attr_encrypted :password, key: [Rails.application.credentials.encryption_key].pack("H*")
  # add secrets file
  attr_encrypted :password, key: [ENV["ENCDATING"]].pack("H*")
 
  has_many :relationships
  has_many :stories
  has_many :characters
end
