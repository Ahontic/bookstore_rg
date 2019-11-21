# frozen_string_literal: true

RSpec.describe HomeController, type: :controller do
  describe 'GET #home' do
    it 'returns http success' do
      expect(response).to be_ok
    end
  end
end
