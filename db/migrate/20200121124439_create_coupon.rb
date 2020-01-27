# frozen_string_literal: true

class CreateCoupon < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code, null: false
      t.string :description, null: false
      t.integer :discount_percent, null: false
      t.belongs_to :cart, foreign_key: true

      t.timestamps null: false
    end
  end
end
