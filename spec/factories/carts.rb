# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id             :bigint           not null, primary key
#  number         :string
#  status         :integer
#  use_billing    :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  credit_card_id :bigint
#  customer_id    :bigint
#  delivery_id    :bigint
#
# Indexes
#
#  index_carts_on_credit_card_id  (credit_card_id)
#  index_carts_on_customer_id     (customer_id)
#  index_carts_on_delivery_id     (delivery_id)
#
# Foreign Keys
#
#  fk_rails_...  (credit_card_id => credit_cards.id)
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (delivery_id => deliveries.id)
#

FactoryBot.define do
  factory :cart do
  end
end
