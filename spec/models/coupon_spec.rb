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

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
