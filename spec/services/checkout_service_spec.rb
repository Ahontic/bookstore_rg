# frozen_string_literal: true

RSpec.describe CheckoutService do
  subject { CheckoutService.new(current_cart, current_customer, step, cookies, params) }
  let(:cookies) {}
  let(:params) { FactoryBot.attributes_for(:address) }
  let(:current_customer) { create(:customer) }
  let(:current_cart) { create(:cart) }

  describe 'service' do
    context 'allows customer to' do
      let(:step) { :address }
      it 'update cart addresses' do
        @service = CheckoutService.new(current_cart, current_customer, step, cookies, params)
        @service.billing.update(params.merge(address_type: 'billing'))
        @service.shipping.update(params.merge(address_type: 'shipping'))

        expect(@service.billing.valid?).to eq(true)
        expect(@service.shipping.valid?).to eq(true)
      end
    end
  end
end
