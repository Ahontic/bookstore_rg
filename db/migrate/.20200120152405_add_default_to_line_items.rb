class AddDefaultToLineItems < ActiveRecord::Migration[6.0]
  def change
    change_column :line_items, :quantity, :integer, default: 1
  end
end
