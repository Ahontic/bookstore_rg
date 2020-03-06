# frozen_string_literal: true

class ChangeDepthNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :depth, false
  end
end
