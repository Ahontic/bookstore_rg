# frozen_string_literal: true

class CheckoutRendererService < ApplicationController
  attr_reader :cart, :customer, :step, :cookies

  def initialize(current_cart, current_customer, step, cookies, cart_params)
    @cart_params = cart_params
    @current_cart = current_cart
    @cookies = cookies
    @step = step
    @current_customer = current_customer
  end

  def call
    send(step)
  end

  def update(step, cart_params)
    case step
    when :address then update_addresses(cart_params)
    end
  end

  def login
    cookies[:from_checkout] = { value: true, expires: 1.day.from_now }
  end

  def address
    billing && shipping
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

  def update_addresses(cart_params)
    type = %w[0 billing].include?(cart_params[:address_type]) ? billing : shipping
    type.update(cart_params.except('address_type'))
  end

  def delivery; end

  def payment; end

  def confirm; end

  def complete; end
end
