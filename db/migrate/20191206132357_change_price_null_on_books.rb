class ChangePriceNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :price, false
  end
end
