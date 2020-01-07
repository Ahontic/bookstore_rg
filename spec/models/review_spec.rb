# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :string
#  rating      :integer
#  status      :integer          default("pending")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :integer
#  customer_id :integer
#

RSpec.describe Review do
  let(:review) { create(:review) }

  describe 'validations' do
    it 'is expected to validate that :status is pending' do
      expect(review.status).to eq('pending')
    end
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:customer) }
  end
end
