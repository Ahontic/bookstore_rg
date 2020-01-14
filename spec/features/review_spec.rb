# frozen_string_literal: true

feature 'Book page' do
  let!(:customer) { create(:customer, :confirmed) }
  let!(:book) { create(:book, :with_author) }

  feature 'allows customer to write a review', js: true do
    scenario 'successfully creates review' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)
      within('#new_review') do
        find("#rating-form img[alt='5']").hover.click
        fill_in 'Title', with: 'Title test'
        fill_in 'Review', with: 'Review test'
      end
      click_button 'Post'
      expect(page).to have_content 'Thanks for Review'
    end
  end
end
