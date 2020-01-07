# frozen_string_literal: true

class AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.create(address_params)
    flash_errors
    redirect_to edit_customer_registration_path
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    @address.update(address_params)
    flash_errors
    redirect_to edit_customer_registration_path
  end

  private

  def flash_errors
    if @address.errors.any?
      flash[:alert] = @address.errors.full_messages.join('. ').html_safe
    else
      flash[:notice] = 'Your address has been added.'
    end
  end

  def address_params
    params[:address].permit(:first_name, :last_name, :address, :city, :country, :phone, :zipcode, :address_type)
  end
end
