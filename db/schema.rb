# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_218_105_129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'addresses', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'address', null: false
    t.integer 'zipcode', null: false
    t.string 'city', null: false
    t.string 'phone', null: false
    t.string 'country', null: false
    t.integer 'address_type', null: false
    t.string 'addressable_type'
    t.bigint 'addressable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable_type_and_addressable_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'biography'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'book_authors', force: :cascade do |t|
    t.integer 'author_id'
    t.integer 'book_id'
    t.index %w[author_id book_id], name: 'book_author'
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'description', null: false
    t.decimal 'price', null: false
    t.integer 'quantity', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'category_id', null: false
    t.integer 'issue_date', null: false
    t.decimal 'height', null: false
    t.decimal 'width', null: false
    t.decimal 'depth', null: false
    t.bigint 'material_id', null: false
    t.index ['category_id'], name: 'index_books_on_category_id'
    t.index ['material_id'], name: 'index_books_on_material_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'use_billing', default: false
    t.bigint 'customer_id'
    t.index ['customer_id'], name: 'index_carts_on_customer_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['title'], name: 'index_categories_on_title', unique: true
  end

  create_table 'coupons', force: :cascade do |t|
    t.string 'code'
    t.string 'description'
    t.integer 'discount_percent'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'cart_id'
    t.index ['cart_id'], name: 'index_coupons_on_cart_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'avatar'
    t.index ['confirmation_token'], name: 'index_customers_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_customers_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_customers_on_reset_password_token', unique: true
  end

  create_table 'line_items', force: :cascade do |t|
    t.integer 'quantity', default: 0
    t.bigint 'book_id'
    t.bigint 'cart_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_line_items_on_book_id'
    t.index ['cart_id'], name: 'index_line_items_on_cart_id'
  end

  create_table 'materials', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'body', null: false
    t.integer 'rating', null: false
    t.integer 'status', default: 0
    t.bigint 'book_id'
    t.bigint 'customer_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_id'], name: 'index_reviews_on_book_id'
    t.index ['customer_id'], name: 'index_reviews_on_customer_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'books', 'categories'
  add_foreign_key 'books', 'materials'
  add_foreign_key 'carts', 'customers'
  add_foreign_key 'coupons', 'carts'
  add_foreign_key 'line_items', 'books'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'reviews', 'books'
  add_foreign_key 'reviews', 'customers'
end
