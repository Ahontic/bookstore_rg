# frozen_string_literal: true

RSpec.describe Author do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:books).through(:book_authors) }
    it { is_expected.to have_many(:book_authors) }
  end
end
