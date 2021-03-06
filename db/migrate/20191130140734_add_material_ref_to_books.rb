# frozen_string_literal: true

class AddMaterialRefToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :material, null: false, foreign_key: true
  end
end
