# frozen_string_literal: true

class CheckoutsController < ApplicationController
  include Wicked::Wizard

  before_action :login_step_authentication_check, :line_items_check, only: :show

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    @service = CheckoutService.new(current_cart, current_customer, step, cookies, params)
    @service.call
    move_to_right_step

    render_wizard
    empty_cart_if_order_done
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

  def line_items_check
    return redirect_to root_path if current_cart.line_items.none?
  end

  def empty_cart_if_order_done
    current_cart.line_items.delete_all if cookies[:order_done] == true
  end

  def move_to_right_step
    jump_to(previous_step) if ConditionStepService.new(current_cart, step).call
  end
end
