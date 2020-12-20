# frozen_string_literal: true

RSpec.describe Customer do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_confirmation_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:reviews) }
  end
end
