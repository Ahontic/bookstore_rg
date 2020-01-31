# frozen_string_literal: true

# == Schema Information
#
# Table name: coupons
#
#  id               :bigint           not null, primary key
#  code             :string
#  description      :string
#  discount_percent :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cart_id          :bigint
#
# Indexes
#
#  index_coupons_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#
RSpec.describe Coupon do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:discount_percent) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:cart).without_validating_presence }
  end
end
