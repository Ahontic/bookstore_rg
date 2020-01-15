# frozen_string_literal: true

class ReviewsController < ApplicationController
  decorates_assigned :book

  def index
    @book = BookDecorator.find_by(id: params[:book_id])
    redirect_to category_book_path(id: @book.id, category_id: @book.category_id)
  end

  def create
    @book = BookDecorator.find_by(id: params[:book_id])
    @review = Review.new(review_params)
    @reviews = @book.reviews.approved
    if @review.save
      flash[:notice] = 'Thanks for Review. It will be published as soon as Admin will approve it.'
      redirect_back(fallback_location: root_path)
    else
      render 'books/show'
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :book_id, :customer_id)
  end
end
