# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id          :bigint           not null, primary key
#  use_billing :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint
#
# Indexes
#
#  index_carts_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#

RSpec.describe Cart do
  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:books).through(:line_items) }
    it { is_expected.to have_one(:coupon) }
    it { is_expected.to belong_to(:customer).optional }
  end
end