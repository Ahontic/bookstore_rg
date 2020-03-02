# frozen_string_literal: true

feature 'Checkout page' do
  let!(:book) { create(:book) }
  let!(:customer) { create(:customer, :confirmed) }
  let!(:delivery) { create_list(:delivery, 3) }
  let(:valid_address_params) { FactoryBot.attributes_for(:address) }
  let(:valid_credit_card_params) { FactoryBot.attributes_for(:credit_card) }
  let(:checkout_page) { CheckoutPage.new(valid_address_params, valid_credit_card_params) }

  feature 'Checkout', js: true do
    scenario 'address step' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)

      checkout_page.add_to_cart.click
      checkout_page.checkout.click
      checkout_page.fill_in_address_form
      checkout_page.save_and_continue.click

      expect(checkout_page).to have_current_path(checkout_path(:delivery))

      expect(checkout_page.delivery).to have_content(delivery.first.name)
      checkout_page.save_and_continue.click

      expect(checkout_page).to have_current_path(checkout_path(:payment))

      checkout_page.fill_credit_card_form
      checkout_page.save_and_continue.click

      expect(checkout_page).to have_current_path(checkout_path(:confirm))

      ['Billing', 'Shipping', 'Shipments', 'Payment Information'].each do |content|
        expect(page).to have_content(content)
      end

      expect(checkout_page).to have_book_image
      expect(checkout_page).to have_content(book.title)
      expect(checkout_page).to have_content(book.line_items.first.quantity)

      checkout_page.place_order.click

      expect(checkout_page).to have_content(I18n.t('checkout.complete.thank_you'))
      expect(checkout_page).to have_current_path(checkout_path(:complete))
    end
  end
end
