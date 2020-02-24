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

class CreditCard < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :carts, dependent: :destroy

  validates :number, :name_on_card, :month_year, :cvv, presence: true

  validates :name_on_card, length: { maximum: 50 }
  validates :number, length: { is: 16 }
  validates :cvv, length: 3..4
  validates :number, :cvv, numericality: { only_integer: true }

  validates :name_on_card, format: /\A[a-zA-Z]*\s*[a-zA-Z]*\z/
  validates :month_year, format: %r{\A(0[1-9]|10|11|12)/\d{2}\z}
end
