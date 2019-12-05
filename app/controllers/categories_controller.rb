# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @pagy, @books = pagy(BookSorter.call(params))
  end

  def show
    @category = Category.find(params[:id])
  end
end
