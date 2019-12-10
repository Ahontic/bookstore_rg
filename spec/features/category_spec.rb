# frozen_string_literal: true

feature 'Category page' do
  let!(:category) { FactoryBot.create(:category) }
  let!(:material) { FactoryBot.create(:material) }
  let!(:book) { FactoryBot.create(:book) }

  before do
    visit categories_path
  end

  scenario 'has appropriate content' do
    expect(page).to have_content I18n.t(:catalog)
    expect(page).to have_current_path categories_path

    expect(page).to have_link I18n.t(:all)
  end

  scenario 'when click onto a category proceed to Category page' do
    find('a', text: category.title).click
    expect(page).to have_link("categories/#{category.id}/books/#{book.id}")
  end
end
