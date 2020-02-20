RSpec.describe Cart do
  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:books).through(:line_items) }
    it { is_expected.to have_one(:coupon) }
    it { is_expected.to belong_to(:customer).optional }
  end
end
