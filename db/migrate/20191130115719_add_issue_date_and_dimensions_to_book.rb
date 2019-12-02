class AddIssueDateAndDimensionsToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :issue_date, :integer
    add_column :books, :height, :decimal
    add_column :books, :width, :decimal
    add_column :books, :depth, :decimal
  end
end
