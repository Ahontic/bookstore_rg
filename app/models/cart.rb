# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items
  has_one :coupon

  def sub_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end

  def discount
    coupon.nil? ? 0.00 : sub_total * coupon.discount_percent / 100
  end

  def order_total
    coupon.nil? ? sub_total : sub_total - discount
  end
end
