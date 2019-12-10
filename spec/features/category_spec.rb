# frozen_string_literal: true

feature 'Category page' do
  let(:category) { FactoryBot.create(:category) }
  let(:material) { FactoryBot.create(:material) }
  let!(:book) { FactoryBot.create(:book, material: material, category: category) }

  before do
    visit categories_path
  end

  scenario 'has appropriate content' do
    expect(page).to have_content I18n.t(:catalog)
    expect(page).to have_current_path categories_path

    expect(page).to have_link I18n.t(:all)
    expect(page).to have_link category.title
  end

  scenario 'when click onto a category proceed to Category page' do
    click_on category.title
    first('.thumb-hover-link').click
    expect(page).to have_current_path("/categories/#{category.id}/books/#{book.id}")
    expect(page).to have_content I18n.t('book.dimensions')
    expect(page).to have_content I18n.t('book.year_of_publication')
    expect(page).to have_content I18n.t('book.description')
  end
end
