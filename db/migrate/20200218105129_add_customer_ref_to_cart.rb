# frozen_string_literal: true

class AddCustomerRefToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :customer, foreign_key: true
  end
end
