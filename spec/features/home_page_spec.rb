# frozen_string_literal: true

feature 'Home page' do
  let!(:category) { create(:category) }
  before :each do
    visit root_path
  end

  scenario 'has appropriate content' do
    expect(page).to have_content I18n.t(:title)
    expect(page).to have_button(I18n.t(:get_started))
    expect(page).to have_content I18n.t(:latest_books)
    expect(page).to have_content I18n.t(:best_sellers)
    expect(page).to have_link I18n.t(:home)
  end

  scenario 'when click Home proceed to Home page' do
    first('a', text: I18n.t(:home)).click
    expect(page).to have_content(I18n.t(:welcome_to_store))
  end

  scenario 'when click Get Started proceed to Catalog page' do
    click_link(I18n.t(:shop), match: :first)
    click_link(category.title)

    expect(page).to have_content(I18n.t(:catalog))
  end
end
