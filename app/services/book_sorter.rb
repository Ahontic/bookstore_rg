# frozen_string_literal: true

class BookSorter < ApplicationService
  DEFAULT_FILTER = 'newest_first'

  def initialize(params, books = Book.all)
    @params = params
    @books = books
  end

  def call
    current_sort = Book::AVAILABLE_FILTERS.values.include?(@params[:status]) ? (@params[:status]).to_s : DEFAULT_FILTER
    @books.public_send(current_sort)
  end
end
