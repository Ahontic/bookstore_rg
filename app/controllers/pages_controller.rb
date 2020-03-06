# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @categories = Category.all
    @latest = Book.latest.map(&:decorate)
    @best_sellers = Book.most_popular_books(4)
  end
end
