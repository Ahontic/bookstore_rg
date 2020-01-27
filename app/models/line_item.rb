# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  cart_id    :integer
#  order_id   :integer
#

class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def total_price
    quantity * book.price
  end
end
