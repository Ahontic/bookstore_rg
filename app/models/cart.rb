# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id             :bigint           not null, primary key
#  number         :string
#  status         :integer
#  use_billing    :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  credit_card_id :bigint
#  customer_id    :bigint
#  delivery_id    :bigint
#
# Indexes
#
#  index_carts_on_credit_card_id  (credit_card_id)
#  index_carts_on_customer_id     (customer_id)
#  index_carts_on_delivery_id     (delivery_id)
#
# Foreign Keys
#
#  fk_rails_...  (credit_card_id => credit_cards.id)
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (delivery_id => deliveries.id)
#

class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items
  has_many :addresses, as: :addressable, dependent: :destroy
  has_one :coupon
  belongs_to :customer, optional: true

  def sub_total
    line_items.sum(&:total_price)
  end

  def discount
    coupon ? sub_total * coupon.discount_percent / 100 : 0.00
  end

  def order_total
    coupon ? sub_total - discount : sub_total
  end
end
