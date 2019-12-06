# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_title  (title) UNIQUE
#

class Category < ApplicationRecord
  has_many :books

  validates :title, presence: true, uniqueness: true
end
