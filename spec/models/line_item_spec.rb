# frozen_string_literal: true

# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  cart_id    :bigint
#
# Indexes
#
#  index_line_items_on_book_id  (book_id)
#  index_line_items_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (cart_id => carts.id)
#

RSpec.describe LineItem do
  describe 'validations' do
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:cart) }
  end
end
