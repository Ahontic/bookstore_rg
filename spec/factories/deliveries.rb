# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    name { FFaker::Book.title }
    price { rand(1.1...99.9).round(2) }
    time { FFaker::Book.description.truncate(25) }
  end
end
