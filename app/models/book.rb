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

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category

  validates :title, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
