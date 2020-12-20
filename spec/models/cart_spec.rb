# frozen_string_literal: true

RSpec.describe Cart do
  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:books).through(:line_items) }
    it { is_expected.to have_one(:coupon) }
    it { is_expected.to belong_to(:customer).optional }
  end

  describe 'validations' do
    it {
      expect(subject).to define_enum_for(:status).with_values(waiting_for_processing: 0, in_delivery: 1, delivered: 2,
                                                              canceled: 3)
    }
  end
end
