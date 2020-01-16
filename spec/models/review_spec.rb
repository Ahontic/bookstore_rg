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
#  book_id     :bigint
#  customer_id :bigint
#
# Indexes
#
#  index_reviews_on_book_id      (book_id)
#  index_reviews_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (customer_id => customers.id)
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
