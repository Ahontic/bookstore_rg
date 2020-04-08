# frozen_string_literal: true

# == Schema Information
#
# Table name: credit_cards
#
#  id           :bigint           not null, primary key
#  cvv          :string
#  month_year   :string
#  name_on_card :string
#  number       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :credit_card do
    number { FFaker::Bank.card_number.gsub!(/\s+/, '') }
    name_on_card { FFaker::Book.author }
    cvv { rand(0o01..9999) }
    month_year { FFaker::Bank.card_expiry_date }
  end
end
