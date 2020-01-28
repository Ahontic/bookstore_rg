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

class Coupon < ApplicationRecord
  validates :description, :code, :discount_percent, uniqueness: true, presence: true
  belongs_to :cart
end
