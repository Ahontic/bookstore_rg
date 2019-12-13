# frozen_string_literal: true

class ChangeWidthNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :width, false
  end
end
