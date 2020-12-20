# frozen_string_literal: true

RSpec.describe Book do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:authors).through(:book_authors) }
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:reviews) }

    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:material) }
  end
end
