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

FactoryBot.define do
  factory :coupon do
    code { FFaker::CheesyLingo.unique.word.upcase }
    description { FFaker::Book.description }
    discount_percent { rand(3..15) }

    trait :with_cart do
      cart
    end
  end
end
