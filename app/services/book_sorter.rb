# frozen_string_literal: true

class BookSorter < ApplicationService
  DEFAULT_FILTER = 'newest_first'

  def initialize(params, books = Book.all)
    @params = params
    @books = books.includes(:authors)
  end

  def call
    @books.public_send(current_sort)
  end

  private

  def current_sort
    return @params[:status] if Book::AVAILABLE_FILTERS.values.include?(@params[:status])

    DEFAULT_FILTER
  end
end
