# frozen_string_literal: true
class AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.create(address_params)
    redirect_to edit_customer_registration_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to edit_customer_registration_path
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :address, :city, :country, :phone, :zipcode, :address_type)
  end
end
