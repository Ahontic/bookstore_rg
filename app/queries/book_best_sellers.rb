# frozen_string_literal: true

class BookBestSellers
  COUNT_BOOK_BEST_SELLERS = 4

  class << self
    def call
      Book.find(LineItem.group(:book_id).sum(:quantity).first(COUNT_BOOK_BEST_SELLERS).to_h.keys)
    end
  end
end
