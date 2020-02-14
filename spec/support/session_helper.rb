# frozen_string_literal: true

def sign_up
  visit new_customer_registration_path

  fill_in :email, with: FFaker::Internet.disposable_email
  fill_in :password, with: '7qLyxOACqQ'
  fill_in :password_confirmation, with: '7qLyxOACqQ'

  click_on 'Sign up'
end

def sign_in(customer)
  visit new_customer_session_path

  fill_in :email, with: customer.email
  fill_in :password, with: customer.password

  click_on 'Log In'
end

def sign_up_with(email: FFaker::Internet.disposable_email, password: '7qLyxOACqQ')
  visit new_customer_registration_path

  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password

  click_on 'Sign Up'
end

def sign_in_with(email: FFaker::Internet.disposable_email, password: '')
  visit new_customer_session_path

  fill_in :email, with: email
  fill_in :password, with: password

  click_on 'Log In'
end

def fill_in_address_billing_form
  within('#new_address', match: :first) do
    %w[first_name last_name address city phone zipcode].each do |field|
      fill_in "address[#{field}]", with: invalid_params[field.to_sym]
    end
  end
end

def fill_in_address_form
  %w[first_name last_name address city phone].each do |field|
    fill_in "cart_billing_#{field}", with: valid_params[field.to_sym]
    fill_in 'cart_billing_zipcode', with: 12_345
    fill_in 'cart_shipping_zipcode', with: 12_345
    fill_in "cart_shipping_#{field}", with: valid_params[field.to_sym]
  end
end
