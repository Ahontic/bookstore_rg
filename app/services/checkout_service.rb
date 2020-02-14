# frozen_string_literal: true

class CheckoutService < ApplicationService
  attr_reader :cart, :customer, :step, :cookies, :use_billing

  def initialize(current_cart, current_customer, step, cookies, params)
    @params = params
    @current_cart = current_cart
    @cookies = cookies
    @step = step
    @current_customer = current_customer
  end

  def call
    send(step)
  end

  def save
    case step
    when :address then update_addresses
    end
  end

  def billing
    @billing ||= begin
        attributes = @current_customer.addresses.billing.first&.attributes || {}
        @current_cart.addresses.billing.first_or_initialize(attributes.except('id', 'addressable_type',
                                                                              'addressable_id'))
      end
  end

  def shipping
    @shipping ||= begin
      attributes = @current_customer.addresses.shipping.first&.attributes || {}
      @current_cart.addresses.shipping.first_or_initialize(attributes.except('id', 'addressable_type',
                                                                             'addressable_id'))
    end
  end

  def cart_params
    @params.require(:cart).permit(:use_billing,
                                  billing: %i[first_name last_name address city zipcode country phone],
                                  shipping: %i[first_name last_name address city zipcode country phone])
  end

  def address_params_type(type)
    type = cart_params[:use_billing] == '1' ? :billing : type
    cart_params.require(type)
  end

  private

  def login
    cookies[:from_checkout] = { value: true, expires: 1.day.from_now }
  end

  def update_addresses
    billing.update(address_params_type(:billing)) & shipping.update(address_params_type(:shipping))
  end

  def address
    billing && shipping
  end

  def delivery; end

  def payment; end

  def confirm; end

  def complete; end
end
