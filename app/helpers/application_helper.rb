# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def categories
    @categories ||= Category.all
  end
end
