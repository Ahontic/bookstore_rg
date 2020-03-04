# frozen_string_literal: true

class CategoriesController < ApplicationController
  decorates_assigned :category, :books
  before_action :show_filter, only: %i[index show]

  def index
    @pagy, @books = pagy(BookSorter.call(sort_params))
  end

  def show
    @category = Category.find(params[:id])
    @pagy, @books = pagy(BookSorter.call(sort_params, @category.books))
  end

  private

  def sort_params
    params.permit(:status, :id, :category)
  end

  def show_filter
    @filter = params[:status] ? params[:status].to_s : BookSorter::DEFAULT_FILTER
  end
end
