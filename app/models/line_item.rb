# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  cart_id    :bigint
#
# Indexes
#
#  index_line_items_on_book_id  (book_id)
#  index_line_items_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (cart_id => carts.id)
#

class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }

  def total_price
    quantity * book.price
  end
end
