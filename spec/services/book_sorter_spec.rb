# frozen_string_literal: true

RSpec.describe BookSorter do
  subject { BookSorter.call(status: status) }
  let(:author) { create(:author) }
  let(:category) { create(:category) }
  let(:material) { create(:material) }
  let(:book2) do
    create(:book, title: 'Adam', price: 20,
                  created_at: Date.today - 2, category: category, material: material)
  end
  let(:book3) do
    create(:book, title: 'Bob', price: 10,
                  created_at: Date.today, category: category, material: material)
  end
  let(:book4) do
    create(:book, title: 'Clark', price: 30,
                  created_at: Date.today - 1, category: category, material: material)
  end

  describe 'scope' do
    context 'sort books by' do
      context 'Newest first' do
        let(:status) { 'newest_first' }
        example 'Newest first' do
          expect(subject).to eq([book3, book4, book2])
        end
      end
      context 'Price: low to high' do
        let(:status) { 'price_low_to_high' }
        example 'Price: low to high' do
          expect(subject).to eq([book3, book2, book4])
        end
      end
      context 'A - Z' do
        let(:status) { 'alphabetically' }
        example 'A - Z' do
          expect(subject).to eq([book2, book3, book4])
        end
      end
      context 'Popular first' do
        let(:status) { 'popular_first' }
        example 'Popular first' do
          expect(subject).to eq([book2, book4, book3])
        end
      end
      context 'Price: high to low' do
        let(:status) { 'price_high_to_low' }
        example 'Price: high to low' do
          expect(subject).to eq([book4, book2, book3])
        end
      end
      context 'Z - A' do
        let(:status) { 'analphabetically' }
        example 'Z - A' do
          expect(subject).to eq([book4, book3, book2])
        end
      end
    end
  end
end
