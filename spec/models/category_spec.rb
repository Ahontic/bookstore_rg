# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_title  (title) UNIQUE
#

RSpec.describe Category do
  let(:category) { create(:category) }

  describe 'validations' do
    it 'is expected to validate that :title is case-sensitively unique' do
      expect(category).to validate_uniqueness_of(:title)
    end

    it { is_expected.to validate_presence_of(:title) }
  end
  describe 'associations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end
end
