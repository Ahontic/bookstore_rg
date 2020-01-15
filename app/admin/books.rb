# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :price, :quantity, :category_id, :material_id, :description, :issue_date, :height, :width,
                :depth
end
