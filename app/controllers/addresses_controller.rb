# frozen_string_literal: true

class AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.create(address_params)
    # current_customer.addresses << @address
  end

  def update
    @address.update(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:address, :city, :country, :phone, :zipcode)
  end
end
