require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  let(:user) {create(:user, :organization)}

  specify 'a captured ticket appears in the list of "my captured" status tickets' do
    ticket = create(:ticket)
    log_in_as(user)
    click_on 'Dashboard'
    click_on 'Tickets'
    click_on ticket.name
    click on 'Capture'
    click_on 'Tickets'
    fill_in 'Status', with: 'My captured'
    click_on 'Tickets'
  end
end
