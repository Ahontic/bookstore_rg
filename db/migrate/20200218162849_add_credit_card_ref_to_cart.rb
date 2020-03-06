# frozen_string_literal: true

class AddCreditCardRefToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :credit_card, foreign_key: true
  end
end
