# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    use_billing { true }
    customer
  end
end
