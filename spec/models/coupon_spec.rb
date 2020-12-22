# frozen_string_literal: true

RSpec.describe Coupon do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:discount_percent) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:cart).without_validating_presence }
  end
end
