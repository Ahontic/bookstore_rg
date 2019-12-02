# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  depth       :decimal(, )
#  description :string
#  height      :decimal(, )
#  issue_date  :integer
#  price       :decimal(, )
#  quantity    :integer
#  title       :string
#  width       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  category_id :bigint           not null
#  material_id :bigint           not null
#
# Indexes
#
#  index_books_on_author_id    (author_id)
#  index_books_on_category_id  (category_id)
#  index_books_on_material_id  (material_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
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
    author_id { Author.ids.sample }
    category_id { Category.ids.sample }
    issue_date { rand(1990..2010) }
    material_id { Material.ids.sample }
  end
end