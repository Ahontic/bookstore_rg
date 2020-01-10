# frozen_string_literal: true

class AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.create(address_params)
    if @address.save
      flash[:notice] = 'Your address has been added.'
      redirect_to edit_customer_registration_path
    else
      render 'devise/registrations/edit'
    end
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = 'Your address has been added.'
      redirect_to edit_customer_registration_path
    else
      render 'devise/registrations/edit'
    end
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
