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
FactoryBot.define do
  factory :user do
    
  end
end
