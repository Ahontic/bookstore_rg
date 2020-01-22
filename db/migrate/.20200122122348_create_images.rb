# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.binary :image_filename, limit: 10.megabyte
      t.belongs_to :book, foreign_key: true
    end
  end
end
