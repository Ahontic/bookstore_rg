# frozen_string_literal: true

class Customers::ConfirmationsController < Devise::ConfirmationsController
  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    if cookies[:from_checkout]
      cookies.delete :from_checkout
      checkout_path(:address)
    else
      super
    end
  end
end
