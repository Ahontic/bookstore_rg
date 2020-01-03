# frozen_string_literal: true

class AddAddressTypeEnumToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :address_type, :integer, null: false
  end
end
