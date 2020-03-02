# frozen_string_literal: true

class CheckoutService < ApplicationService
  attr_reader :cart, :customer, :step, :cookies, :use_billing

  def initialize(current_cart, current_customer, step, cookies, params)
    @params = params
    @cart = current_cart
    @cookies = cookies
    @step = step
    @customer = current_customer
  end

  def call
    send(step)
  end

  def save
    case step
    when :address then update_addresses
    when :delivery then update_delivery
    when :payment then update_payment
    when :confirm then update_confirm
    when :complete then complete
    end
  end

  def billing
    attributes = @customer.addresses.billing.first&.attributes || {}
    @billing ||= @cart.addresses.billing.first_or_initialize(attributes.except(*attr_from_customer_address_form))
  end

  def shipping
    attributes = @customer.addresses.shipping.first&.attributes || {}
    @shipping ||= @cart.addresses.shipping.first_or_initialize(attributes.except(*attr_from_customer_address_form))
  end

  def cart_params
    @params.require(:cart).permit(
      :use_billing,
      billing: %i[first_name last_name address city zipcode country phone address_type],
      shipping: %i[first_name last_name address city zipcode country phone address_type]
    )
  end

  def credit_card_params
    @params.require(:cart).require(:credit_card).permit(%i[number name_on_card month_year cvv])
  end

  def address_params_type(type)
    type = cart_params[:use_billing] ? :billing : type
    cart_params.require(type)
  end

  def update_delivery
    @cart.update(delivery_id: @params[:cart][:delivery_id])
  end

  def delivery
    Delivery.all
  end

  def update_payment
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.save
    @cart.update(credit_card_id: @credit_card.id) if @credit_card.save
  end

  def update_confirm
    @cart.update(customer_id: @customer.id)
  end

  def payment
    @cart.credit_card || CreditCard.new
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

  def attr_from_customer_address_form
    %w[id addressable_type addressable_id]
  end

  def confirm; end

  def complete
    OrderMailer.send_order_confirmation(customer).deliver_later
  end
end
