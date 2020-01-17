# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :rating, null: false
      t.integer :status, default: 0
      t.belongs_to :book, foreign_key: true
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
