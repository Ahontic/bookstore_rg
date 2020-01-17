# frozen_string_literal: true

class ReviewsController < ApplicationController
  decorates_assigned :book

  def index
    book = Book.find(params[:book_id])
    redirect_to category_book_path(book.category_id, book.id)
  end

  # rubocop:disable Metrics/AbcSize
  def create
    @book = Book.find(params[:book_id])
    review = @book.reviews.new(review_params.merge(customer: current_customer))
    if review.save
      flash[:notice] = I18n.t('review.review_created')
      redirect_to category_book_path(@book.category_id, @book.id)
    else
      render 'books/show'
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
