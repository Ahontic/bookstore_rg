# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @pagy, @books = pagy(BookSorter.call(sort_params))
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def sort_params
    params.permit(:status)
  end
end
