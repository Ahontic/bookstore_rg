# frozen_string_literal: true

class Cart < ApplicationRecord
  AVAILABLE_FILTERS = {
    I18n.t('order_sort.waiting_for_processing') => 'waiting_for_processing',
    I18n.t('order_sort.in_delivery') => 'in_delivery',
    I18n.t('order_sort.delivered') => 'delivered',
    I18n.t('order_sort.canceled') => 'canceled'
  }.freeze

  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_one :coupon, dependent: :destroy

  belongs_to :customer, optional: true
  belongs_to :delivery, optional: true
  belongs_to :credit_card, optional: true

  after_create :set_number_and_status

  enum status: { waiting_for_processing: 0, in_delivery: 1, delivered: 2, canceled: 3 }

  def sub_total
    line_items.sum(&:total_price)
  end

  def discount
    coupon ? sub_total * coupon.discount_percent / 100 : 0.00
  end

  def order_total
    price_with_coupon = coupon ? sub_total - discount : sub_total
    delivery ? price_with_coupon + delivery.price : sub_total
  end

  private

  def set_number_and_status
    update(number: "R#{id.to_s.rjust(8, '0')}")
  end
end
