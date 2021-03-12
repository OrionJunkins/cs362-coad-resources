require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  let(:user) {create(:user, :organization)}

  specify 'users can capture a ticket' do
    skip
    user = create(:user, :organization)
    user.organization = create(:organization)
    ticket = create(:ticket, :open)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    find_by_id('commit').click
    visit ticket_path(ticket)
    click_on 'Capture'
    visit ticket_path(ticket)
    expect(page.body).to have_text('Release')
    expect(page.body).to have_text(:user.organization.name)
  end
end
