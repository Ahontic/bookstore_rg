# frozen_string_literal: true

describe 'Category page' do
  let(:category1) { create(:category) }
  let(:category2) { create(:category) }
  let(:material) { create(:material) }
  let!(:book1) { create(:book, material: material, category: category1) }
  let!(:book2) { create(:book, material: material, category: category2) }

  before do
    visit categories_path
  end

  it 'has categories with its content' do
    expect(page).to have_content I18n.t(:catalog)
    expect(page).to have_current_path categories_path

    expect(page).to have_link I18n.t(:all)
    expect(page).to have_link category1.title
    expect(page).to have_link category2.title

    first('a', text: category1.title).click
    expect(page).to have_content book1.title
    expect(page).not_to have_content book2.title

    first('a', text: category2.title).click
    expect(page).to have_content book2.title
    expect(page).not_to have_content book1.title

    click_on I18n.t(:all)
    expect(page).to have_content book1.title
    expect(page).to have_content book2.title
  end
end
