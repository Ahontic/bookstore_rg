# frozen_string_literal: true

RSpec.describe BookDecorator do
  let(:book) { create(:book, :with_author).decorate }

  describe 'decorates' do
    example 'dimensions' do
      expect(book.dimensions).to eq("H:#{book.height}\" x W: #{book.width}\" x D: #{book.depth}\"")
    end

    example 'authors names ' do
      expect(book.authors_names).to eq(book.authors.reduce.full_name)
    end
  end
end
