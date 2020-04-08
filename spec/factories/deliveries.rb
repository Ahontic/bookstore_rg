# frozen_string_literal: true

# == Schema Information
#
# Table name: deliveries
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(, )
#  time       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :delivery do
    name { FFaker::Book.title }
    price { rand(1.1...99.9).round(2) }
    time { FFaker::Book.description.truncate(25) }
  end
end
