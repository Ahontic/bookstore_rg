# frozen_string_literal: true

class CategoriesController < ApplicationController
  decorates_assigned :category, :books

  def index
    @categories = Category.all
    @pagy, @books = pagy(BookSorter.call(sort_params))
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @pagy, @books = pagy_arel(@category.books)
  end

  private

  def sort_params
    params.permit(:status, :category, :commit, :id)
  end
end
