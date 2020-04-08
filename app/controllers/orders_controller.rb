# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :order_finder, only: %i[show]

  def show; end

  private

  def order_finder
    @order = Cart.find_by(id: params[:id])
  end
end
