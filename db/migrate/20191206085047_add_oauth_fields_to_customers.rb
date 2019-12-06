class AddOauthFieldsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :provider, :string
    add_column :customers, :uid, :string
  end
end
