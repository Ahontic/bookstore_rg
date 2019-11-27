# frozen_string_literal: true

class CatalogController < ApplicationController
  def index
    @categories = Category.order(:title)
  end
end
