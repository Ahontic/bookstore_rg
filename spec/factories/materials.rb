# frozen_string_literal: true

FactoryBot.define do
  factory :material do
    name { FFaker::Vehicle.interior_upholstery }
  end
end
