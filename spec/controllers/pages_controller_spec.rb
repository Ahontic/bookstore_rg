# frozen_string_literal: true

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    it 'returns http ok' do
      expect(response).to be_ok
    end
  end
end
