# frozen_string_literal: true

class AddressFormService
  include ActiveModel::Model

  attr_reader :customer, :cart

  def initialize(cart:, customer:)
    @customer = customer
    @cart = cart
    @billing = billing
    @shipping = shipping
  end
end
