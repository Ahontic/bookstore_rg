# == Schema Information
#
# Table name: book_authors
#
#  id        :bigint           not null, primary key
#  author_id :integer
#  book_id   :integer
#
# Indexes
#
#  book_author  (author_id,book_id)
#

class BookAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author
end
