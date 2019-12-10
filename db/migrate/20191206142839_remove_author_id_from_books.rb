# frozen_string_literal: true

class RemoveAuthorIdFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :author_id
  end
end
