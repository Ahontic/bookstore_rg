# == Schema Information
#
# Table name: materials
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :material do
    name { FFaker::Vehicle.unique.interior_upholstery }
  end
end
