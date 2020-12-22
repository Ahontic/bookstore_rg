# frozen_string_literal: true

class Address < ApplicationRecord
  REGEX_RULES = { name_on_card: /\A[a-zA-Z]*\s*[a-zA-Z]*\z/, common_name_rule: /\A[a-zA-Z ']*\z/,
                  address: /\A[a-zA-Z0-9 \-,']*\z/, zipcode: /\A[0-9 \-]*\z/, phone: /\A\+[0-9 \-]*\z/ }.freeze

  belongs_to :addressable, polymorphic: true

  validates :first_name, :last_name, :address, :city, :country, :phone, :zipcode, :address_type, presence: true
  validates :first_name, :last_name, :city, :country, format: { with: Address::REGEX_RULES[:common_name_rule] },
                                                      length: { maximum: 50 }
  validates :address, format: { with: Address::REGEX_RULES[:address] }, length: { maximum: 50 }
  validates :zipcode, format: { with: Address::REGEX_RULES[:zipcode] }, length: { maximum: 10 }
  validates :phone, format: { with: Address::REGEX_RULES[:phone] }, length: { maximum: 15 }

  enum address_type: { billing: 0, shipping: 1 }
end
