# frozen_string_literal: true

class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = 'Thanks for Review. It will be published as soon as Admin will approve it.'
    else
      flash[:danger] = @review.errors.full_messages.join('. ').gsub('Text', 'Review')
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :book_id, :customer_id)
  end
end
