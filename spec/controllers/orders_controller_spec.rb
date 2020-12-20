# frozen_string_literal: true

RSpec.describe OrdersController do
  let!(:order) { create(:cart) }

  describe 'GET #show' do
    it 'returns http ok' do
      get :show, params: { id: order.id }
      expect(response).to be_ok
    end
  end
end
