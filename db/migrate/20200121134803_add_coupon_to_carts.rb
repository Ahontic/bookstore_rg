# frozen_string_literal: true

class AddCouponToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :coupons, :cart, foreign_key: true
  end
end
