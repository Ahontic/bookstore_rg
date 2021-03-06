# frozen_string_literal: true

describe 'Account' do
  let(:customer) { create(:customer, password: '7qLyxOACqQ', confirmed_at: '2019-12-18 10:37:37.104758') }
  let(:lower_case_error_message) { /Password must contain at least one lower-case letter/ }
  let(:upper_case_error_message) { /Password must contain at least one upper-case letter/ }
  let(:digit_error_message) { /Password must contain at least one digit/ }

  it 'allows guest to create account successfully' do
    sign_up
    expect { customer }.to change(Customer, :count).by(1)
  end

  describe 'forbids guest to create account with' do
    it 'numerical password only' do
      sign_up_with(password: '123456')
      expect(page).to have_content(lower_case_error_message)
      expect(page).to have_content(upper_case_error_message)
    end

    it 'alphabetical password only' do
      sign_up_with(password: 'Aqaaaaa')
      expect(page).to have_content(digit_error_message)
    end

    it 'out upper-case letter password' do
      sign_up_with(password: '123aaa')
      expect(page).to have_content(upper_case_error_message)
    end

    it 'too short password' do
      sign_up_with(password: '123Qw')
      expect(page).to have_content('Password is too short (minimum is 6 characters)')
    end
  end

  it 'user signs in successfully' do
    sign_in customer
    visit root_path
    click_link(I18n.t('my_account'))

    expect(page).to have_content(customer.email)
    expect(page).to have_content('Sign Out')
  end

  it 'user attempts to sign in with irrelevant data' do
    sign_in_with(email: '', password: customer.password)
    expect(page).to have_content('Invalid Email or password')
  end
end
