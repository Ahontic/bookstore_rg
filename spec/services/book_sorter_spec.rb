# frozen_string_literal: true

RSpec.describe BookSorter do
  let(:author) { FactoryBot.create(:author) }
  let(:category) { FactoryBot.create(:category) }
  let(:material) { FactoryBot.create(:material) }
  let(:book2) { FactoryBot.create(:book, category_id: category.id, author_id: author.id, material_id: material.id) }
  let(:book3) { FactoryBot.create(:book, category_id: category.id, author_id: author.id, material_id: material.id) }

  describe 'scope' do
    context 'sort books by' do
      example 'newest_first' do
        expect(BookSorter.call(status: :newest_first)).to eq(Book.order(created_at: :desc))
      end

      example 'popular_first' do
        expect(BookSorter.call(status: :popular_first)).to eq(Book.order(created_at: :asc))
      end

      example 'price_low_to_high' do
        expect(BookSorter.call(status: :price_low_to_high)).to eq(Book.order(price: :asc))
      end

      example 'price_high_to_low' do
        expect(BookSorter.call(status: :price_high_to_low)).to eq(Book.order(price: :desc))
      end

      example 'alphabetically' do
        expect(BookSorter.call(status: :alphabetically)).to eq(Book.order(title: :asc))
      end

      example 'analphabetically' do
        expect(BookSorter.call(status: :analphabetically)).to eq(Book.order(title: :desc))
      end
    end
  end
end
