# frozen_string_literal: true

class BookSorter < ApplicationService
  DEFAULT_FILTER = 'newest_first'

  def initialize(params, books = Book.all)
    @params = params
    @books = books
  end

  def call
    current_sort = if Book::AVAILABLE_FILTERS.values.include?(@params[:status])
                     I18n.t('book_sort').key((@params[:status]).to_s)
                   else
                     DEFAULT_FILTER
                   end
    @books.public_send(current_sort)
  end
end
