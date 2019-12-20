# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  address    :string
#  city       :string
#  country    :string
#  phone      :integer
#  zipcode    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  validates :address, :city, :country, :phone, :zipcode, presence: true
end
