# frozen_string_literal: true

class AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.create(address_params)
    if @address.errors.any?
      flash[:danger] = @address.errors.full_messages.join('. ')
    else
      flash[:success] = 'You address has been added.'
    end
    redirect_to edit_customer_registration_path
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to edit_customer_registration_path
  end

  private

  def address_params
    params.permit(:first_name, :last_name, :address, :city, :country, :phone, :zipcode, :address_type)
  end
end
