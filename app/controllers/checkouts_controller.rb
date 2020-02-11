# frozen_string_literal: true

class CheckoutsController < ApplicationController
  include Wicked::Wizard

  before_action :test_case_name, only: :show

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    @service = CheckoutRendererService.new(current_cart, current_customer, step, cookies, params)
    @service.call
    render_wizard
  end

  def update
    @service = CheckoutRendererService.new(current_cart, current_customer, step, cookies, cart_params)
    redirect_to next_wizard_path if @service.update(step, cart_params)
    render_wizard
  end

  def test_case_name
    redirect_to wizard_path(next_step) if customer_signed_in? && step == :login
  end

  def cart_params
    type = params[:cart][:billing].except('country').values.reject!(&:empty?) ? :shipping : :billing
    params[:cart].require(type).permit(:first_name, :last_name, :address, :city, :zipcode, :country, :phone,
                                       :address_type)
  end
end
