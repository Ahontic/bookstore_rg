# frozen_string_literal: true

class AddressesController < ApplicationController
  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      flash[:notice] = I18n.t('address.address_created')
      redirect_to edit_customer_registration_path
    else
      render 'devise/registrations/edit'
    end
  end

  def show
    redirect_to edit_customer_registration_path
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @address.update(address_params)
      flash[:notice] =  I18n.t('address_modified')
      redirect_to edit_customer_registration_path
    else
      render 'devise/registrations/edit'
    end
  end

  private

  def address_params
    params[:address].permit(:first_name, :last_name, :address, :city, :country, :phone, :zipcode, :address_type)
  end
end
