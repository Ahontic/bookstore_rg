# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  cart_id    :integer
#  order_id   :integer
#

class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart
  belongs_to :order

  # LOGIC
  def total_price
    quantity * product.price
  end
end
