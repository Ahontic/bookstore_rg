# frozen_string_literal: true

# Seeding Authors
FactoryBot.create_list(:author, 5)
# Seeding Books
FactoryBot.create_list(:book, 20)
# Seeding Materials
FactoryBot.create_list(:material, 3)
# Seeding Category
categories = ['Mobile Development', 'Photo', 'Web Design']
categories.each { |category| Category.create(title: category) }
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
