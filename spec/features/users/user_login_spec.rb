require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  specify 'logs in a user with valid credentials' do
    user = create(:user)
    visit root_path
    click_on 'Log in'
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    expect(page.body).to have_text('Signed in')
  end

  specify 'rejects a user with invalid credentials' do
    user = create(:user)
    invalid_password = "Invalid"
    visit root_path
    click_on 'Log in'
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: invalid_password
    click_on 'Sign in'
    expect(page.body).to have_text('Invalid Email or password.')
  end
  
end
