# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address          :string           not null
#  addressable_type :string
#  city             :string           not null
#  country          :string           not null
#  phone            :integer          not null
#  zipcode          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#

FactoryBot.define do
  factory :address do
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    phone { FFaker::PhoneNumber.short_phone_number }
    zipcode { FFaker::AddressUS.zip_code }
    addressable_id { Customer.ids.sample }
    addressable_type { Customer }
  end
end
