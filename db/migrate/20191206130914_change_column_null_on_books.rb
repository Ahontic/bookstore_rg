# frozen_string_literal: true

class ChangeColumnNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :authors, :first_name, false
  end
end
