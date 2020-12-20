# frozen_string_literal: true

class Coupon < ApplicationRecord
  validates :description, :code, uniqueness: true, presence: true
  validates :discount_percent, presence: true
  belongs_to :cart, optional: true
end
