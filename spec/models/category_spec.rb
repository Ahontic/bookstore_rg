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
