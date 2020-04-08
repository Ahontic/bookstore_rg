# frozen_string_literal: true

class OrderSorter < ApplicationService
  DEFAULT_FILTER = 'waiting_for_processing'

  def initialize(params, carts = Cart.all)
    @params = params
    @carts = carts
  end

  def call
    @carts.public_send(current_sort)
  end

  private

  def current_sort
    return @params[:status] if Cart::AVAILABLE_FILTERS.values.include?(@params[:status])

    DEFAULT_FILTER
  end
end
