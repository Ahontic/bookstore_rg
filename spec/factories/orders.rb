# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :order do
    name { "MyString" }
    email { "MyString" }
    address { "MyText" }
  end
end
