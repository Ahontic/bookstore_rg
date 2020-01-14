# frozen_string_literal: true

class BooksController < ApplicationController
  decorates_assigned :book

  def show
    @book = BookDecorator.find_by(id: params[:id], category_id: params[:category_id]) if legal_partial?
    @reviews = @book.reviews.approved
  end

  private

  def legal_partial?
    Book.ids.to_s.include? params[:id]
  end
end
