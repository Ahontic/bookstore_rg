# frozen_string_literal: true

describe 'Address page', type: :feature do
  let!(:customer) { create(:customer, :confirmed) }
  let(:invalid_params) { FactoryBot.attributes_for(:address, first_name: 'Qaz123') }
  let(:invalid_name_error_message) { /First name is invalid/ }

  describe 'forbids customer to create address with' do
    it 'invalid_params' do
      sign_in(customer)
      visit edit_customer_registration_path
      fill_in_address_billing_form
      first('.btn[type=submit]').click
      expect(page).to have_content(invalid_name_error_message)
    end
  end
end
