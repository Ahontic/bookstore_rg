# frozen_string_literal: true

RSpec.describe BookSorter do
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }
  let(:material) { FactoryBot.create(:material) }
  let(:book2) do
    FactoryBot.create(:book, title: 'Adam', price: 10,
                             created_at: Date.today, category: category, material: material)
  end
  let(:book3) do
    FactoryBot.create(:book, title: 'Bob', price: 20,
                             created_at: Date.today - 1, category: category, material: material)
  end
  let(:expected_result) { [book2, book3] }

  describe 'scope' do
    context 'sort books by' do
      %w[newest_first price_low_to_high alphabetically].each do |filter|
        example filter.to_s do
          expect(BookSorter.call(status: filter)).to eq(expected_result)
        end
      end
      %w[popular_first price_high_to_low analphabetically].each do |filter|
        example filter.to_s do
          expect(BookSorter.call(status: filter)).to eq(expected_result.reverse)
        end
      end
    end
  end
end
