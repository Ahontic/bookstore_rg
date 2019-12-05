# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_title  (title) UNIQUE
#
FactoryBot.define do
  factory :category do
    title { FFaker::Book.unique.genre }
  end
end
