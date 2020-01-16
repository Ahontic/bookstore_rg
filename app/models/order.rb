# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
end
