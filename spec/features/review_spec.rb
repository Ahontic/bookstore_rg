# frozen_string_literal: true

feature 'Book page' do
  let!(:customer) { create(:customer, :confirmed) }
  let!(:book) { create(:book, :with_author) }
  let!(:review_approved) { create(:review, book: book, customer: customer, status: 'approved') }
  let!(:review_pending) { create(:review, book: book, customer: customer) }
  let!(:review_rejected) { create(:review, book: book, customer: customer, status: 'rejected') }

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

      visit category_book_path(category_id: book.category_id, id: book.id)
      expect(page).to_not have_content 'Review test'
      review = Review.last
      review.status = 'approved'
      review.save
      page.driver.browser.navigate.refresh
      expect(page).to have_content 'Review test'
    end

    scenario 'customer sees only approved reviews' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)
      expect(page).to have_content(review_approved.body)
      expect(page).to_not have_content(review_pending.body)
      expect(page).to_not have_content(review_rejected.body)
    end
  end

  feature 'when customer not signed in' do
    scenario 'unable to leave reviews' do
      visit category_book_path(category_id: book.category_id, id: book.id)
      expect(page).to_not have_content 'Write a Review'
    end
  end
end
