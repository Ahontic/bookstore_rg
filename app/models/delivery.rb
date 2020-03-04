# frozen_string_literal: true

# == Schema Information
#
# Table name: deliveries
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(, )
#  time       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Delivery < ApplicationRecord
  has_many :carts
  validates :name, :time, :price, presence: true

  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
  validates :price, numericality: true
end
