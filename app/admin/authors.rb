# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :first_name, :last_name, :biography
end
