# frozen_string_literal: true

ActiveAdmin.register Customer do
  permit_params :email
  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end
end
