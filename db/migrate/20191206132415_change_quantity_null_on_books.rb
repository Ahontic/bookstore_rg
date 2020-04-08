# frozen_string_literal: true

class ChangeQuantityNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :quantity, false
  end
end
