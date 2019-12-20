# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address, null: false
      t.integer :zipcode, null: false
      t.string :city, null: false
      t.integer :phone, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
