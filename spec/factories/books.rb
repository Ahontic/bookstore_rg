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
#

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(10..100) }
    quantity { rand(1..10) }
    description { FFaker::Book.description }
  end
end
