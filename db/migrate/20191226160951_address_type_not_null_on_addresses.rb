# frozen_string_literal: true

class AddressTypeNotNullOnAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :address_type, :string, default: nil
  end
end
