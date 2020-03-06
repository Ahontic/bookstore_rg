# frozen_string_literal: true

class ChangeHeightNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :height, false
  end
end
