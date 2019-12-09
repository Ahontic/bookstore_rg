# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  depth       :decimal(, )      not null
#  description :string           not null
#  height      :decimal(, )      not null
#  issue_date  :integer          not null
#  price       :decimal(, )      not null
#  quantity    :integer          not null
#  title       :string           not null
#  width       :decimal(, )      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  material_id :bigint           not null
#
# Indexes
#
#  index_books_on_category_id  (category_id)
#  index_books_on_material_id  (material_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (material_id => materials.id)
#

RSpec.describe Book do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:material) }
  end
end
