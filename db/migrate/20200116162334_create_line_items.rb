# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 0
      t.belongs_to :book, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
