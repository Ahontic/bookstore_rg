# frozen_string_literal: true

class ReviewsController < ApplicationController
  decorates_assigned :book

  def index
    redirect_back(fallback_location: root_path)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = 'Thanks for Review. It will be published as soon as Admin will approve it.'
      redirect_back(fallback_location: root_path)
    else
      @book = BookDecorator.find_by(id: params[:book_id])
      binding.pry
      render 'books/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :book_id, :customer_id)
  end
end
