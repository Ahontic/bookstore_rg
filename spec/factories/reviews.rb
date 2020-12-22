# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    body { FFaker::Lorem.phrase }
    rating { rand(1..5) }
    customer
    book
  end
end
