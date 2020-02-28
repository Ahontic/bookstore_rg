# frozen_string_literal: true

class OrderSorter < ApplicationService
  DEFAULT_FILTER = 'waiting_for_processing'

  def initialize(params, carts = Cart.all)
    @params = params
    @carts = carts
  end

  def call
    current_sort = Cart::AVAILABLE_FILTERS.values.include?(@params[:status]) ? (@params[:status]).to_s : DEFAULT_FILTER
    @carts.public_send(current_sort)
  end
end
