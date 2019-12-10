# frozen_string_literal: true

class MigrateDatabaseState < ActiveRecord::Migration[6.0]
  def change
    ActiveRecord::Base.transaction do
      Book.where.not(author_id: nil).find_each do |book|
        next if BookAuthor.find_by(book_id: book.id, author_id: book.author_id)

        BookAuthor.create!(book_id: book.id, author_id: book.author_id)
      end
    end
  end
end
