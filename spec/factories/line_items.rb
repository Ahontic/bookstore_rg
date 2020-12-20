# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    quantity { rand(1..10) }
    book
    cart
  end
end
