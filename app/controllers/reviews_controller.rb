# frozen_string_literal: true

class ReviewsController < ApplicationController
  decorates_assigned :book

  def index
    @book = BookDecorator.find_by(id: params[:book_id])
    redirect_to category_book_path(id: @book.id, category_id: @book.category_id)
  end

  def create
    @book = BookDecorator.find_by(id: params[:book_id]) if legal_partial?
    @review = Review.new(review_params)
    @reviews = @book.reviews.approved
    if @review.save
      flash[:notice] = 'Thanks for Review. It will be published as soon as Admin will approve it.'
      redirect_back(fallback_location: root_path)
    else
      render 'books/show'
    end
  end

  private

  def legal_partial?
    Book.ids.to_s.include? params[:book_id]
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating, :book_id, :customer_id)
  end
end
