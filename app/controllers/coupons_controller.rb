# frozen_string_literal: true

class CouponsController < ApplicationController
  def create
    coupon = Coupon.find_by(code: coupon_params[:code])

    if coupon
      @current_cart.update(coupon: coupon)
      flash[:notice] = I18n.t('coupon.successfully_applied')
    else
      flash[:alert] = I18n.t('coupon.invalid')
    end
    redirect_to cart_path(@current_cart)
  end

  def destroy
    @current_cart.coupon.update(cart_id: nil)
    flash[:notice] = I18n.t('coupon.removed')
    redirect_to cart_path(@current_cart)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
