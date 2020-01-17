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
#  book_id     :bigint
#  customer_id :bigint
#
# Indexes
#
#  index_reviews_on_book_id      (book_id)
#  index_reviews_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (customer_id => customers.id)
#

FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    body { FFaker::Lorem.phrase }
    rating { rand(1..5) }
    customer
    book
  end
end
