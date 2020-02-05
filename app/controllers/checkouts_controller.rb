# frozen_string_literal: true

class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :login, :address, :delivery, :payment, :confirm, :complete

  # rubocop:disable Metrics/CyclomaticComplexity
  def show
    case step
    when :login then login
    when :address then address
    when :delivery then delivery
    when :payment then payment
    when :confirm then confirm
    when :complete then complete
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  private

  def login
    if step.eql?(:login) && customer_signed_in?
      redirect_to wizard_path(next_step)
    else
      render_wizard
    end
    cookies[:from_checkout] = { value: true, expires: 1.day.from_now }
  end

  def address
    if customer_signed_in?
      render_wizard
    else
      redirect_to wizard_path(previous_step)
    end
  end

  def delivery
    return jump_to(previous_step) unless current_customer.addresses.presence

    render_wizard
  end

  def payment; end

  def confirm; end

  def complete; end
end
