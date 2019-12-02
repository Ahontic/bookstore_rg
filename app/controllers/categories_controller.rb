# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @pagy, @books = pagy(Book.where(nil))
    @books = if params[:status].key?('Price low to high')
               Book.price_low_to_high
             # case params[:status]
             # when 'Newest first' then @books = Book.newest_first
             # when 'Popular first' then @books = Book.popular_first
             # when 'Price low to high' then @books = Book.price_low_to_high
             # when 'Price: high to low' then @books = Book.price_high_to_low
             else
               Book.all
             end
  end

  def show
    @category = Category.find(params[:id])
  end
end
