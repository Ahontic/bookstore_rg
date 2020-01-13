# frozen_string_literal: true

feature 'Address page' do
  let!(:customer) { create(:customer, :confirmed) }
  let(:invalid_params) { FactoryBot.attributes_for(:address, first_name: 'Qaz123') }
  let(:invalid_name_error_message) { /First name is invalid/ }

  feature 'forbids customer to create address with' do
    scenario 'invalid_params' do
      login_as(customer)
      visit edit_customer_registration_path
      fill_in_address_billing_form
      first('.btn[type=submit]').click
      expect(page).to have_content(invalid_name_error_message)
    end
  end
end
