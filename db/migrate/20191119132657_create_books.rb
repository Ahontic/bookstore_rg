# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
