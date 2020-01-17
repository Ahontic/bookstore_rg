# frozen_string_literal: true

ActiveAdmin.register Review do
  permit_params :title, :body, :rating, :customer_id, :book_id, :status
end
