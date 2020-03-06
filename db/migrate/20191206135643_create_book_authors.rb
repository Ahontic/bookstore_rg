# frozen_string_literal: true

class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :book_authors do |t|
      t.integer :author_id
      t.integer :book_id
    end
  end
end
