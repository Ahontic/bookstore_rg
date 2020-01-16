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

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
