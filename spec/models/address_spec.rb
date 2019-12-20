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

RSpec.describe Address do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:zipcode) }
  end
end
