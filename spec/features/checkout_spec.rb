# frozen_string_literal: true

feature 'Checkout page' do
  let!(:book) { create(:book) }
  let!(:customer) { create(:customer, :confirmed) }
  let(:valid_params) { FactoryBot.attributes_for(:address) }

  feature 'allows customer to', js: true do
    scenario 'add address to cart' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)

      click_button 'Add to Cart'
      click_button 'Checkout'
      fill_in_address_form
      click_button 'Save and Continue'

      expect(page).to have_current_path(checkout_path(:delivery))
    end
  end
end
