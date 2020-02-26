# frozen_string_literal: true

RSpec.describe CheckoutService do
  subject { described_class.new(current_cart, current_customer, step, cookies, params) }
  let(:cookies) {}
  let(:params) do
    ActionController::Parameters.new('cart': { 'billing': FactoryBot.attributes_for(:address),
                                               'shipping': FactoryBot.attributes_for(:address),
                                               'delivery_id': delivery.id,
                                               'credit_card': FactoryBot.attributes_for(:credit_card) })
  end
  let(:current_customer) { create(:customer) }
  let(:current_cart) { create(:cart, customer: current_customer) }
  let(:delivery) { create(:delivery) }

  describe '#save' do
    before do
      subject.save
    end

    context 'when step is address' do
      let(:step) { :address }

      example 'update cart with addresses' do
        expect(current_cart.addresses.billing).to be_exists
        expect(current_cart.addresses.shipping).to be_exists
      end
    end

    context 'when step is delivery' do
      let(:step) { :delivery }

      example 'update cart with delivery' do
        expect(current_cart.delivery).to be_present
      end
    end

    context 'when step is payment' do
      let(:step) { :payment }

      example 'update cart with payment' do
        expect(current_cart.credit_card).to be_present
      end
    end
  end
end
