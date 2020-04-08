# frozen_string_literal: true

RSpec.describe BookDecorator do
  let(:book) { create(:book) }
  let(:author) { create(:author, first_name: 'Artur', last_name: 'Clark') }

  describe 'decorates' do
    example 'dimensions' do
      expect(book.decorate.dimensions).to eq("H:#{book.height}\" x W: #{book.width}\" x D: #{book.depth}\"")
    end

    example 'authors names ' do
      book.authors.push(author)
      expect(book.decorate.authors_names).to eq('Artur Clark')
    end
  end
end
