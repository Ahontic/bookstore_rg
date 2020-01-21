# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coupon_id  :bigint
#
# Indexes
#
#  index_orders_on_coupon_id  (coupon_id)
#
# Foreign Keys
#
#  fk_rails_...  (coupon_id => coupons.id)
#

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :coupon, optional: true
end
