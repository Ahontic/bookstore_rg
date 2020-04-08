# frozen_string_literal: true

class BooksController < ApplicationController
  decorates_assigned :book

  def show
    @book = BookDecorator.find_by(id: params[:id], category_id: params[:category_id])
  end
end
