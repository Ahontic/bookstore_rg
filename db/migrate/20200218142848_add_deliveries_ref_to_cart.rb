# frozen_string_literal: true

class AddDeliveriesRefToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :delivery, foreign_key: true
  end
end
