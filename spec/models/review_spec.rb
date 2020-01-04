# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :string
#  rating      :integer
#  status      :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :integer
#  customer_id :integer
#

require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
