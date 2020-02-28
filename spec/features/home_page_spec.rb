# frozen_string_literal: true

feature 'Home page' do
  let!(:book) { create_list(:book, 4) }
  let!(:category) { create(:category) }
  let(:home_page) { HomePage.new }
  before :each do
    visit root_path
  end

  scenario 'has appropriate content' do
    expect(home_page).to have_title
    expect(home_page).to have_get_started
    expect(home_page).to have_latest_books
    expect(home_page).to have_best_sellers
    expect(home_page).to have_home_page_link
  end

  scenario 'when click Home proceed to Home page' do
    first('a', text: I18n.t(:home)).click
    expect(page).to have_content(I18n.t(:welcome))
  end

  scenario 'when click Get Started proceed to Catalog page' do
    first('a', text: I18n.t(:shop)).click
    first('a', text: category.title).click

    expect(page).to have_content(I18n.t(:catalog))
  end

  scenario 'slider' do
    expect(home_page).to have_slider
  end
end
