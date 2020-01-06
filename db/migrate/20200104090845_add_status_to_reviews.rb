# frozen_string_literal: true

class AddStatusToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :status, :integer, default: 0
  end
end
