# frozen_string_literal: true

class CheckoutsController < ApplicationController
  include Wicked::Wizard

  before_action :login_step_authentication_check, only: :show

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    @service = CheckoutService.new(current_cart, current_customer, step, cookies, params)
    @service.call
    render_wizard
  end

  def update
    @service = CheckoutService.new(current_cart, current_customer, step, cookies, params)
    render_wizard(@service, id: step)
  end

  private

  def login_step_authentication_check
    redirect_to wizard_path(next_step) if signed_at_login_step?
  end

  def signed_at_login_step?
    customer_signed_in? && step == :login
  end
end
