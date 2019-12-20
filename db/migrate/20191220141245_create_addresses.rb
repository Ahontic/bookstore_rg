# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :zipcode
      t.string :city
      t.integer :phone
      t.string :country

      t.timestamps
    end
  end
end
