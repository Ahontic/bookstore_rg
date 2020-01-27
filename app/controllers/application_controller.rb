# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      cart.present? ? @current_cart = cart : session[:cart_id] = nil
    end

    return unless session[:cart_id].nil?

    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end
  helper_method :current_cart
end
