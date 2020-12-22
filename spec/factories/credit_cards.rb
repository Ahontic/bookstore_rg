# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card do
    number { FFaker::Bank.card_number.gsub!(/\s+/, '') }
    name_on_card { FFaker::Book.author }
    cvv { rand(0o01..9999) }
    month_year { FFaker::Bank.card_expiry_date }
  end
end
