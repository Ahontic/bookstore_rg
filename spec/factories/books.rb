# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  depth       :decimal(, )      not null
#  description :string           not null
#  height      :decimal(, )      not null
#  issue_date  :integer          not null
#  price       :decimal(, )      not null
#  quantity    :integer          not null
#  title       :string           not null
#  width       :decimal(, )      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  material_id :bigint           not null
#
# Indexes
#
#  index_books_on_category_id  (category_id)
#  index_books_on_material_id  (material_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (material_id => materials.id)
#

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(10..100) }
    quantity { rand(1..10) }
    description { FFaker::Book.description }
    depth { rand(1.0..10.0).round(2) }
    height { rand(1.0..10.0).round(2) }
    width { rand(1.0..10.0).round(2) }
    category
    issue_date { rand(1990..2010) }
    material

    after(:create) do |book, _evaluator|
      book.authors << build(:author)
    end
  end
end
