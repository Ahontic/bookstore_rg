class ChangeLastNameNullOnBooks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :authors, :last_name, false
  end
end
