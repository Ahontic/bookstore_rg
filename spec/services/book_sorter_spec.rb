# frozen_string_literal: true

RSpec.describe BookSorter do
  let(:author) { create(:author) }
  let(:category) { create(:category) }
  let(:material) { create(:material) }
  let(:book2) do
    create(:book, title: 'Adam', price: 10,
                  created_at: Date.today, category: category, material: material)
  end
  let(:book3) do
    create(:book, title: 'Bob', price: 20,
                  created_at: Date.today - 1, category: category, material: material)
  end
  let(:book4) do
    create(:book, title: 'Clark', price: 30,
                  created_at: Date.today - 2, category: category, material: material)
  end
  let(:expected_result) { [book2, book3, book4] }
  let(:reversed_expected_result) { [book4, book3, book2] }

  describe 'scope' do
    context 'sort books by' do
      example 'Newest first' do
        expect(BookSorter.call(status: 'Newest first')).to eq(expected_result)
      end
      example 'Price: low to high' do
        expect(BookSorter.call(status: 'Price: low to high')).to eq(expected_result)
      end
      example 'A - Z' do
        expect(BookSorter.call(status: 'A - Z')).to eq(expected_result)
      end
      example 'Popular first' do
        expect(BookSorter.call(status: 'Popular first')).to eq(reversed_expected_result)
      end
      example 'Price: high to low' do
        expect(BookSorter.call(status: 'Price: high to low')).to eq(reversed_expected_result)
      end
      example 'Z - A' do
        expect(BookSorter.call(status: 'Z - A')).to eq(reversed_expected_result)
      end
    end
  end
end
