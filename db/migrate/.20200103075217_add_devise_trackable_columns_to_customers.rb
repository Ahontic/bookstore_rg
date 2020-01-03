# frozen_string_literal: true

class AddDeviseTrackableColumnsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :sign_in_count, :integer, default: 0, null: false
    add_column :customers, :current_sign_in_at, :datetime
    add_column :customers, :last_sign_in_at, :datetime
    add_column :customers, :current_sign_in_ip, :string
    add_column :customers, :last_sign_in_ip, :string
  end
end
