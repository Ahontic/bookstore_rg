RSpec.describe Customer do
  describe 'associations' do
    it { is_expected.to have_many(:reviews) }
  end
end
