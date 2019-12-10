# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  private

  def record_not_found(exception)
    render json: { error: exception.to_s }, status: :bad_request
  end
end
