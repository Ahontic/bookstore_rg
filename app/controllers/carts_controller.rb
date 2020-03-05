# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :order_finder, only: %i[show show_order]
  before_action :show_filter, only: %i[index show]

  def index
    @orders = OrderSorter.call(params, current_customer.carts).reverse
  end

  def show; end

  def show_order; end

  private

  def order_finder
    @order = Cart.find_by(id: params[:id])
  end

  def show_filter
    @filter = params[:status] ? params[:status].to_s : OrderSorter::DEFAULT_FILTER
  end
end
