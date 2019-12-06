class ChangeDescriptionNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :description, false
  end
end
