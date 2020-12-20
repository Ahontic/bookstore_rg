# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { FFaker::Internet.disposable_email }
    password { '7qLyxOACqQ' }

    trait :confirmed do
      confirmed_at { Time.zone.now }
    end
  end
end
