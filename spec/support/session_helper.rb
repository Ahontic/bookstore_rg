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
