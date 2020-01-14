# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :string
#  rating      :integer
#  status      :integer          default("pending")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :integer
#  customer_id :integer
#

FactoryBot.define do
  factory :review do
    title { 'MyString' }
    body { 'MyString' }
    rating { rand(1..5) }
    customer
    book
  end
end
