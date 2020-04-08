# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @categories = Category.all
    @latest = Book.latest.map(&:decorate)
    @best_sellers = BookBestSellers.call
  end
end
