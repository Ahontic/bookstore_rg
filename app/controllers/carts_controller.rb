# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :show_filter, only: %i[index show]

  def index
    @orders = OrderSorter.call(params, current_customer.carts).reverse
  end

  def show; end

  def show_order; end

  private

  def show_filter
    @filter = params[:status] ? params[:status].to_s : OrderSorter::DEFAULT_FILTER
  end
end
