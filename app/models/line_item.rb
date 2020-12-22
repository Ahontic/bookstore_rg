# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }

  def total_price
    quantity * book.price
  end
end
