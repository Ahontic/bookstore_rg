# frozen_string_literal: true

class ReviewsController < ApplicationController
  decorates_assigned :book

  def index
    book = Book.find(params[:book_id])
    redirect_to category_book_path(book.category_id, book.id)
  end

  def create
    @book = BookDecorator.find_by(id: params[:book_id])
    @review = @book.reviews.new(review_params.merge(customer: current_customer))
    @reviews = @book.reviews.approved
    review_save_messsage
  end

  private

  def review_save_messsage
    if @review.save
      flash[:notice] = I18n.t('review.review_created')
      redirect_to category_book_path(@book.category_id, @book.id)
    else
      render 'books/show'
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
