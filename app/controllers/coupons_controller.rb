# frozen_string_literal: true

class CouponsController < ApplicationController
  def create
    coupon = Coupon.find_by(code: coupon_params[:code])

    if coupon
      @current_cart.update(coupon: coupon)
      flash[:notice] = 'You successfully applied coupon!'
    else
      flash[:alert] = 'Sorry, invalid coupon code! Use valid code.'
    end
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @current_cart.coupon.update(cart_id: nil)
    flash[:notice] = 'You successfully removed coupon!'
    redirect_to cart_path(@current_cart)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
