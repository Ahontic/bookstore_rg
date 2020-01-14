# frozen_string_literal: true

ActiveAdmin.register Address do
  permit_params :address, :address_type, :city, :country, :first_name, :last_name, :phone, :zipcode, :addressable_type
end
