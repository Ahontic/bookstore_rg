# frozen_string_literal: true

class CategoriesController < ApplicationController
  decorates_assigned :category, :categories, :books

  def index
    @categories = CategoryDecorator.decorate_collection(Category.all)
    @pagy, @books = pagy(BookSorter.call(sort_params))
  end

  def show
    @category = CategoryDecorator.find(params[:id]).decorate
  end

  private

  def sort_params
    params.permit(:status)
  end
end
