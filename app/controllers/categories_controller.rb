# frozen_string_literal: true

class CategoriesController < ApplicationController
  decorates_assigned :category, :books

  def index
    @pagy, @books = pagy(BookSorter.call(sort_params))
  end

  def show
    @category = Category.find(params[:id])
    @pagy, @books = pagy(BookSorter.call(sort_params, @category.books))
  end

  private

  def sort_params
    params.permit(:status, :category, :commit, :id)
  end
end
