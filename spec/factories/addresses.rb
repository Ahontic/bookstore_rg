# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  address    :string
#  city       :string
#  country    :string
#  phone      :integer
#  zipcode    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :address do
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    phone { FFaker::PhoneNumber.short_phone_number }
    zipcode { FFaker::AddressUS.zip_code }
  end
end
