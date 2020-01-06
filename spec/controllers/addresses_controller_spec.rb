# frozen_string_literal: true

RSpec.describe AddressesController do
  let!(:customer) { create(:customer, password: '7qLyxOACqQ', confirmed_at: '2019-12-18 10:37:37.104758') }
  let(:address) { customer.addresses.create(FactoryBot.attributes_for(:address)) }
  before { sign_in(customer) }

  describe '#create' do
    it 'creates address record' do
      expect { post :create, params: { address: address } }.to change(Address, :count).by(1)
    end
  end

  describe '#update' do
    before { patch :update, params: { address: address } }
    it 'updates address' do
      expect(assigns(:address)).not_to be_nil
    end
  end
end
