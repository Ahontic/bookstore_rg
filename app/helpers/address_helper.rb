# frozen_string_literal: true

module AddressHelper
  def resource_name
    :customer
  end

  def resource
    @resource ||= Customer.new
  end

  def resource_class
    Customer
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:customer]
  end
end
