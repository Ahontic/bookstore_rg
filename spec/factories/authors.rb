# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  biography  :string
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :author do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    biography { FFaker::DizzleIpsum.sentence }
  end
end
