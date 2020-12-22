# frozen_string_literal: true

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

  scope :latest, -> { order(:created_at).last(3) }

  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :reviews, dependent: :destroy
  has_many_attached :images
  belongs_to :category
  belongs_to :material

  has_many :line_items, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  def self.most_popular_books(quantity = 4)
    Book.find(LineItem.group(:book_id).sum(:quantity).first(quantity).to_h.keys)
  end
end
