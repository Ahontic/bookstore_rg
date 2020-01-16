# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  cart_id    :integer
#  order_id   :integer
#

FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    book_id { 1 }
    cart_id { 1 }
    order_id { 1 }
  end
end
