# frozen_string_literal: true

class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if current_customer.present?
      current_customer.apply_omniauth(request.env['omniauth.auth'])
      redirect_to edit_customer_registration_path, notice: 'Facebook Account Linked!'
    else
      @customer = Customer.from_omniauth(request.env['omniauth.auth'])
      sign_in_and_redirect @customer
    end
  end
end
