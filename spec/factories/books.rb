# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(10..100) }
    quantity { rand(1..10) }
    description { FFaker::Book.description }
    depth { rand(1.0..10.0).round(2) }
    height { rand(1.0..10.0).round(2) }
    width { rand(1.0..10.0).round(2) }
    category
    issue_date { rand(1990..2010) }
    material

    trait :with_author do
      after(:create) do |book, _evaluator|
        book.authors << FactoryBot.build(:author)
      end
    end
  end
end
