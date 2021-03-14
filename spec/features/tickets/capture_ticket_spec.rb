require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  let(:user) {create(:user, :with_organization)}

  specify 'users can capture a ticket' do
    log_in_as(user)
    ticket = create(:ticket, :open)
    visit login_path
    visit ticket_path(ticket)
    click_on 'Capture'
    visit ticket_path(ticket)
    expect(page.body).to have_text('Release')
  end
end
