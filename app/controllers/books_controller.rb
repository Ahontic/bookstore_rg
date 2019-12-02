# frozen_string_literal: true

class BooksController < ApplicationController

  def show
    @book = Book.find_by(id: params[:id], category_id: params[:category_id])
  end
end
