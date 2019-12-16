def sign_up
  visit new_customer_registration_path

  fill_in :email, with: FFaker::Internet.disposable_email
  fill_in :password, with: FFaker::Internet.password
  fill_in :password_confirmation, with: FFaker::Internet.password

  click_on 'Sign up'
end
