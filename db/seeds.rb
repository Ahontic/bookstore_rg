# frozen_string_literal: true

require 'factory_bot_rails'
# Seeding Authors
FactoryBot.create_list(:author, 5)
# Seeding Books
FactoryBot.create_list(:book, 20)
# Seeding Materials
FactoryBot.create_list(:material, 3)
# Seeding Category
categories = ['Mobile Development', 'Photo', 'Web Design']
categories.each { |category| Category.create(title: category) }
