# frozen_string_literal: true

feature 'Account' do
  let(:customer) { create(:customer, password: FFaker::Internet.password) }

  scenario 'allows guest to create an account' do
    sign_up
  end

  scenario 'user sign in' do
    sign_in customer
  end

  scenario 'user attempts to sign in with irrelevant password' do
  end
end
