# frozen_string_literal: true

feature 'Home page' do
  before :each do
    visit root_path
  end

  scenario 'has title' do
    expect(page).to have_content I18n.t(:title)
  end

  scenario 'has link to Home page' do
    expect(page).to have_link I18n.t(:home)
  end

  scenario 'when click Home proceed to Home page' do
    first('a', text: I18n.t(:home)).click
    # click_link(I18n.t(:home))
    expect(page).to have_content('Welcome to our amazing Bookstore!')
  end

  scenario 'has button Get Started' do
    expect(page).to have_button(I18n.t(:get_started))
  end

  scenario 'it shows latest books' do
    expect(page).to have_content I18n.t(:latest_books)
  end

  scenario 'it shows best books' do
    expect(page).to have_content I18n.t(:best_sellers)
  end

  scenario 'when click Get Started proceed to Catalog page' do
    skip('Catalog controller is not exist yet')
    click_link(I18n.t(:shop))

    expect(page).to have_content I18n.t(:to_be_implemented)
  end
end
