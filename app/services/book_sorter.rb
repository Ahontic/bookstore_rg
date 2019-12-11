# frozen_string_literal: true

class BookSorter < ApplicationService
  DEFAULT_FILTER = 'newest_first'

  def initialize(params)
    @params = params
  end

  def call
    current_sort = Book::AVAILABLE_FILTERS[:sort].include?(@params[:status]) ? @params[:status] : DEFAULT_FILTER
    Book.public_send(current_sort)
  end
end
