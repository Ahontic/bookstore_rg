# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    private

    def record_not_found(exceptio)
      render json: { error: exceptio.to_s }, status: :bad_request
    end
end
