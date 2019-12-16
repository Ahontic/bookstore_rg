# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { FFaker::Internet.disposable_email }
    password { FFaker::Internet.password }
  end
end
