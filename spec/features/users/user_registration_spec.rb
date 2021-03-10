require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  specify('user with valid information can register') do
    user_email = 'test@domain.com'
    password = 'password'
    visit root_path
    click_on 'Sign up'
    fill_in 'Email address', with: user_email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    within "form" do
      click_on 'Sign up'
    end
    
    #expect(page.body).to have_text('account created')
  end

end
