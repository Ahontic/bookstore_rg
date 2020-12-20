# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    code { FFaker::CheesyLingo.unique.word.upcase }
    description { FFaker::Book.description }
    discount_percent { rand(3..15) }

    trait :with_cart do
      cart
    end
  end
end
