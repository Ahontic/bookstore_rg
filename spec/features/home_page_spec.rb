# frozen_string_literal: true

describe 'Home page' do
  let!(:book) { create(:book) }
  let!(:category) { create(:category) }
  let(:home_page) { HomePage.new }

  before do
    visit root_path
  end

  it 'has appropriate content' do
    expect(home_page).to have_home_page_link
    expect(home_page).to have_get_started
    expect(home_page).to have_latest_books
    expect(home_page).to have_best_sellers
    expect(home_page).to have_home_page_link
  end

  it 'when click Home proceed to Home page' do
    click_link(I18n.t(:home), match: :first)

    expect(page).to have_content(I18n.t(:welcome))
  end

  it 'when click Get Started proceed to Catalog page' do
    click_link(I18n.t(:shop), match: :first)
    click_link(category.title)

    expect(page).to have_content(I18n.t(:catalog))
  end

  it 'latest book slider' do
    expect(home_page).to have_slider
    expect(home_page).to have_latest_books

    home_page.buy_now_button.click

    expect(home_page).to have_current_path(cart_path(Cart.first.id))
    expect(home_page).to have_content(book.title)
  end

  it 'bestsellers' do
    expect(home_page).to have_best_sellers
  end
end
