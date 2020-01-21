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
#

class Coupon < ApplicationRecord
  validates :description, :code, uniqueness: true, presence: true
  has_many :orders
end
