# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :title, :price, :quantity, :category_id, :material_id, :description, :issue_date, :height, :width,
                :depth, images: []

  form do |f|
    f.inputs do
      %i[title description price quantity category material issue_date height width depth].each do |element|
        f.inputs element
      end
      f.input :images, as: :file, multiple: true, input_html: { multiple: true }
    end

    f.actions
  end

  show do
    attributes_table do
      %i[title description price quantity category material issue_date height width depth].each do |element|
        row element
      end
      row :image do |book|
        ul do
          book.images.each do |img|
            li do
              image_tag(img)
            end
          end
        end
      end
    end
  end
end
