# frozen_string_literal: true

module CheckoutHelper
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
end
