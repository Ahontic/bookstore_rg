class CreateCoupon < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.string :description
      t.integer :discount_percent

      t.timestamps null: false
    end
  end
end
