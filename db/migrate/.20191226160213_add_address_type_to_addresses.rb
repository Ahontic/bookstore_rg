# frozen_string_literal: true

class AddAddressTypeToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :address_type, :string, null: false, default: 0
  end
end
