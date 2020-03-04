# frozen_string_literal: true

class ConditionStepService < ApplicationService
  attr_reader :cart, :step

  def initialize(current_cart, step)
    @cart = current_cart
    @step = step
  end

  def call
    case step
    when :address   then false
    when :delivery  then cart.addresses.none?
    when :payment   then !cart.delivery
    when :confirm   then !cart.credit_card
    when :complete  then !cart.customer
    end
  end
end
