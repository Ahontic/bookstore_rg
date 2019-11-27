# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :string
#  price       :decimal(, )
#  quantity    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create(:book) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:rating) }
  end
end
