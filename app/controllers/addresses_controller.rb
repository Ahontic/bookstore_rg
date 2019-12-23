# frozen_string_literal: true

class AddressesController < ApplicationController
  def new; end

  def create
    @address = current_customer.addresses.new(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:address, :city, :country, :phone, :zipcode)
  end
end
