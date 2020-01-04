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

FactoryBot.define do
  factory :review do
    title { "MyString" }
    body { "MyString" }
    rating { 1 }
  end
end
