# frozen_string_literal: true

describe 'Cart page', type: :feature do
  let!(:customer) { create(:customer, :confirmed) }
  let!(:book) { create(:book, :with_author) }
  let!(:book1) { create(:book, :with_author) }
  let(:coupon) { create(:coupon, cart: nil) }

  describe 'allows customer to' do
    it 'add a book into cart' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)

      click_button 'Add to Cart'
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.price)
    end

    it 'increase/decrease book quantity in cart', :js do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)
      click_button 'Add to Cart'
      find('#add_qty').click

      expect(find('.quantity-input').value.to_i).to eq(2)

      find('#reduce_qty').click
      expect(find('.quantity-input').value.to_i).to eq(1)
    end

    it 'apply valid coupon', :js do
      visit category_book_path(category_id: book.category_id, id: book.id)

      click_button 'Add to Cart'
      within('.coupon') do
        fill_in 'coupon[code]', with: coupon.code
        find('#coupon-code-btn').click
      end

      expect(page).to have_content('You successfully applied coupon!')

      click_on 'Remove Coupon'
      expect(page).to have_content('You successfully removed coupon!')
    end

    it 'apply invalid coupon' do
      visit category_book_path(category_id: book.category_id, id: book.id)
      click_button 'Add to Cart'

      fill_in 'coupon[code]', with: 'TEST'
      find('#coupon-code-btn').click

      expect(page).to have_content('Sorry, invalid coupon code! Use valid code.')
    end
  end

  describe 'allows customer to' do
    it 'remove book from cart' do
      sign_in(customer)
      visit category_book_path(category_id: book.category_id, id: book.id)
      click_button 'Add to Cart'
      visit category_book_path(category_id: book1.category_id, id: book1.id)
      click_button 'Add to Cart'
      find('.close', match: :first).click

      expect(page).to have_content(book1.title)
      expect(page).not_to have_content(book.title)
    end
  end
end
