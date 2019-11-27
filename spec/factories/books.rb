# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :string
#  price       :decimal(, )
#  quantity    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_books_on_author_id    (author_id)
#  index_books_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (category_id => categories.id)
#

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(10..100) }
    quantity { rand(1..10) }
    description { FFaker::Book.description }
  end
end
