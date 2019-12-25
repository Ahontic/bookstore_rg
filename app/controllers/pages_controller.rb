# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @categories = Category.all
  end
end
