# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :order_finder, only: %i[show show_order]
  def index
    @orders = OrderSorter.call(params, current_customer.carts)
  end

  def show; end

  def show_order; end

  private

  def order_finder
    @order = Cart.find_by(id: params[:id])
  end
end
