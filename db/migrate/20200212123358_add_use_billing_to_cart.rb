# frozen_string_literal: true

class AddUseBillingToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :use_billing, :boolean, default: false
  end
end
