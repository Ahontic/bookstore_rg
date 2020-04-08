# frozen_string_literal: true

class CheckoutPage < SitePrism::Page
  set_url '/categories'

  def initialize(valid_address_params, valid_credit_card_params)
    @valid_address_params = valid_address_params
    @valid_credit_card_params = valid_credit_card_params
  end

  element :add_to_cart, "input[value='Add to Cart']"
  element :checkout, :button, 'Checkout', match: :first
  element :save_and_continue, :button, 'Save and Continue'
  element :delivery, "span[class='radio-text']", match: :first
  element :book_image, 'img'
  element :place_order, "input[value='Place Order']"

  def fill_in_address_form
    %w[first_name last_name address city phone].each do |field|
      fill_in "cart_billing_#{field}", with: @valid_address_params[field.to_sym]
      fill_in 'cart_billing_zipcode', with: FFaker::AddressUA.zip_code
      fill_in 'cart_shipping_zipcode', with: FFaker::AddressUA.zip_code
      fill_in "cart_shipping_#{field}", with: @valid_address_params[field.to_sym]
    end
  end

  def fill_credit_card_form
    %w[number name_on_card month_year cvv].each do |field|
      fill_in "cart_credit_card_#{field}", with: @valid_credit_card_params[field.to_sym]
    end
  end
end
