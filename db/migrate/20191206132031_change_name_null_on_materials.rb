class ChangeNameNullOnMaterials < ActiveRecord::Migration[6.0]
  def change
    change_column_null :materials, :name, false
  end
end
