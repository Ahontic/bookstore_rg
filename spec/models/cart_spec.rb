# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id             :bigint           not null, primary key
#  number         :string
#  status         :integer          default("in_progress")
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

RSpec.describe Cart do
  describe 'associations' do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:books).through(:line_items) }
    it { is_expected.to have_one(:coupon) }
    it { is_expected.to belong_to(:customer).optional }
  end

  describe 'validations' do
    it {
      is_expected.to define_enum_for(:status).with_values(in_progress: 0, in_queue: 1, in_delivery: 2, delivered: 3,
                                                          canceled: 4)
    }
  end
end
