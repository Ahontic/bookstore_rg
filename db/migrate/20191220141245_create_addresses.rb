# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.integer :zipcode, null: false
      t.string :city, null: false
      t.string :phone, null: false
      t.string :country, null: false
      t.integer :address_type, null: false
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
