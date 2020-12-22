# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    phone { FFaker::PhoneNumberDA.international_phone_number }
    zipcode { FFaker::AddressUS.zip_code }
    address_type { %w[billing shipping].sample }
  end
end
