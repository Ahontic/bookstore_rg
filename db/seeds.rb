# frozen_string_literal: true

# Seeding Category
categories = ['Mobile Development', 'Photo', 'Web Design'].map do |c|
  Category.create(title: c)
end

ma_catehory = Category.create(title: 'ma_catehory')
category: category
# Seeding Authors
FactoryBot.create_list(:author, 5)
# Seeding Books
10.times { FactoryBot.create(:book, author_id: Author.ids.sample, category_id: Category.ids.sample) }
