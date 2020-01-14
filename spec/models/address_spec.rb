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

RSpec.describe Address do
  describe 'validations' do
    %i[first_name last_name address city country phone zipcode].each do |element|
      it { is_expected.to validate_presence_of(element) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end
end
