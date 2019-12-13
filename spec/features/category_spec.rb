# frozen_string_literal: true

feature 'Category page' do
  let(:category1) { create(:category) }
  let(:category2) { create(:category) }
  let(:material) { create(:material) }
  let!(:book1) { create(:book, material: material, category: category1) }
  let!(:book2) { create(:book, material: material, category: category2) }

  before do
    visit categories_path
  end

  scenario 'has appropriate content' do
    expect(page).to have_content I18n.t(:catalog)
    expect(page).to have_current_path categories_path

    expect(page).to have_link I18n.t(:all)
    expect(page).to have_link category1.title
    expect(page).to have_link category2.title
  end

  scenario 'when click onto category 1' do
    click_on category1.title
    expect(page).to have_content book1.title
    expect(page).not_to have_content book2.title
  end

  scenario 'when click onto category 2' do
    click_on category2.title
    expect(page).to have_content book2.title
    expect(page).not_to have_content book1.title
  end

  scenario 'shows books of all categories' do
    expect(page).to have_content book1.title
    expect(page).to have_content book2.title
  end
end
