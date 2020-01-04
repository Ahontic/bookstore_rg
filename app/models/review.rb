# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  body        :string
#  rating      :integer
#  status      :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :integer
#  customer_id :integer
#

class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  validates :title, :body, :rating, presence: true

  enum status: %i[pending approved rejected]
end
