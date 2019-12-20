# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  city       :string           not null
#  country    :string           not null
#  phone      :integer          not null
#  zipcode    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  validates :address, :city, :country, :phone, :zipcode, presence: true
end
