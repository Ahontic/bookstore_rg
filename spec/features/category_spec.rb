# frozen_string_literal: true

feature 'Category page' do
  before :each do
    visit categories_path
  end

  scenario 'has appropriate content' do
    expect(page).to have_content I18n.t(:catalog)
    expect(page).to have_current_path categories_path

    expect(page).to have_link I18n.t(:all)
  end

  scenario 'when click onto a category proceed to Category page' do
    find('a.filter-link').click
    expect(page).to have_current_path(current_url)
  end
end
