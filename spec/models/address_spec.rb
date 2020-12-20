# frozen_string_literal: true

RSpec.describe Address do
  describe 'validations' do
    %i[first_name last_name address city country phone zipcode].each do |element|
      it { is_expected.to validate_presence_of(element) }
    end
    it { is_expected.to define_enum_for(:address_type).with_values(billing: 0, shipping: 1) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end
end
