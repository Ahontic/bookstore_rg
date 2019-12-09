class AddIndextoBookAuthors < ActiveRecord::Migration[6.0]
  def change
    add_index :book_authors, %I(author_id book_id), name: :book_author
  end
end
