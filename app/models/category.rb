# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :title, presence: true, uniqueness: true, case_sensitive: false
end
