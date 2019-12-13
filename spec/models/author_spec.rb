# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  biography  :string
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
