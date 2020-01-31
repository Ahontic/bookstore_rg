# frozen_string_literal: true

ActiveAdmin.register Coupon do
  permit_params :code, :description, :discount_percent
end
