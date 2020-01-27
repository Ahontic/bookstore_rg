# frozen_string_literal: true

feature 'Cart page' do
  let!(:customer) { create(:customer, :confirmed) }
  let!(:book) { create(:book, :with_author) }
  let(:coupon) { create(:coupon, :skip_validate) }

  feature 'allows customer to', js: true do
    scenario 'add a book into cart' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)

      click_button 'Add to Cart'
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.price)
    end

    scenario 'apply valid coupon' do
      visit category_book_path(category_id: book.category_id, id: book.id)

      click_button 'Add to Cart'

      fill_in 'coupon[code]', with: coupon.code
      first('.btn[type=submit]').click
      expect(page).to have_content('You successfully applied coupon!')

      click_on 'Remove Coupon'
      expect(page).to have_content('You successfully removed coupon!')
    end

    scenario 'apply invalid coupon' do
      visit category_book_path(category_id: book.category_id, id: book.id)
      click_button 'Add to Cart'

      fill_in 'coupon[code]', with: 'TEST'
      first('.btn[type=submit]').click

      expect(page).to have_content('Sorry, invalid coupon code! Use valid code.')
    end
  end
end
