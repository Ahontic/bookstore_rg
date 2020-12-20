# frozen_string_literal: true

RSpec.describe Category do
  describe 'validations' do
    describe 'uniqueness' do
      before { create(:category) }

      it { is_expected.to validate_uniqueness_of(:title) }
    end

    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end
end
