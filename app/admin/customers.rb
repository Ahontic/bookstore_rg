# frozen_string_literal: true

ActiveAdmin.register Customer do
  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end
end
