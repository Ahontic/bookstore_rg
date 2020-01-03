# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address          :string           not null
#  address_type     :integer          not null
#  addressable_type :string
#  city             :string           not null
#  country          :string           not null
#  first_name       :string           not null
#  last_name        :string           not null
#  phone            :string           not null
#  zipcode          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :first_name, :last_name, :address, :city, :country, :phone, :zipcode, :address_type, presence: true
  validates :first_name, :last_name, :city, :country, format: { with: /\A[a-zA-Z ]*\z/ }, length: { maximum: 50 }
  validates :address, format: { with: /\A[a-zA-Z0-9 \-\,]*\z/ }, length: { maximum: 50 }
  validates :zipcode, format: { with: /\A[0-9 \-]*\z/ }, length: { maximum: 10 }
  validates :phone, format: { with: /\A\+[0-9 \-]*\z/ }, length: { maximum: 15 }

  enum address_type: %i[billing shipping]
end
