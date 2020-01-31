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

class Book < ApplicationRecord
  AVAILABLE_FILTERS = {
    I18n.t('book_sort.newest_first') => 'newest_first',
    I18n.t('book_sort.popular_first') => 'popular_first',
    I18n.t('book_sort.price_low_to_high') => 'price_low_to_high',
    I18n.t('book_sort.price_high_to_low') => 'price_high_to_low',
    I18n.t('book_sort.alphabetically') => 'alphabetically',
    I18n.t('book_sort.analphabetically') => 'analphabetically'
  }.freeze

  scope :newest_first, -> { order(created_at: :desc) }
  scope :popular_first, -> { order(created_at: :asc) }
  scope :price_low_to_high, -> { order(price: :asc) }
  scope :price_high_to_low, -> { order(price: :desc) }
  scope :alphabetically, -> { order(title: :asc) }
  scope :analphabetically, -> { order(title: :desc) }

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews
  has_many_attached :images
  belongs_to :category
  belongs_to :material

  has_many :line_items, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
