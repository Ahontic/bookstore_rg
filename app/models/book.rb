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

class Book < ApplicationRecord
  scope :newest_first, -> { order(created_at: :desc) }
  scope :popular_first, -> { order(created_at: :asc) }
  scope :price_low_to_high, -> { order(price: :asc) }
  scope :price_high_to_low, -> { order(price: :desc) }

  belongs_to :author
  belongs_to :category
  belongs_to :material

  validates :title, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
