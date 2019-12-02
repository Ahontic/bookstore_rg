# frozen_string_literal: true

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'returns http ok' do
      get :home
      expect(response).to be_ok
    end
  end
end
