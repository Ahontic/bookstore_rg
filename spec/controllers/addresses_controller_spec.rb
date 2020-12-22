# frozen_string_literal: true

RSpec.describe AddressesController do
  let!(:customer) { create(:customer, :confirmed) }
  let(:address) { FactoryBot.attributes_for(:address) }

  before { sign_in(customer) }

  describe '#create' do
    it 'creates address record' do
      expect { post :create, params: { address: address } }.to change(Address, :count).by(1)
    end
  end
end
