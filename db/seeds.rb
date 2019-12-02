# frozen_string_literal: true

# data = ['Mobile Development', 'Photo', 'Web Design']
# categories = data.map { |category| FactoryBot.build(:category, category) }

# Seeding Authors
FactoryBot.create_list(:author, 5)
# Seeding Books
FactoryBot.create_list(:book, 20)
# Seeding Materials
FactoryBot.create_list(:material, 3)
