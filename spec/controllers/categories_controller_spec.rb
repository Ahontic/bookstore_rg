# frozen_string_literal: true

RSpec.describe CategoriesController do
  describe 'GET #index' do
    it 'returns http ok' do
      get :index
      expect(response).to be_ok
    end
  end
end
