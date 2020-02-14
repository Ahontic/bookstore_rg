# frozen_string_literal: true

class CheckoutsController < ApplicationController
  include Wicked::Wizard

  before_action :test_case_name, only: :show

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    @service = CheckoutService.new(current_cart, current_customer, step, cookies, params)
    @service.call
    render_wizard
  end

  def update
    @service = CheckoutService.new(current_cart, current_customer, step, cookies, params)
    render_wizard @service
  end

  def test_case_name
    redirect_to wizard_path(next_step) if customer_signed_in? && step == :login
  end
end
