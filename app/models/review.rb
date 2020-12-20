# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  validates :title, :body, :rating, presence: true

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
