require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  let(:admin) {create(:user, :admin)}

  specify 'renders a notification after a ticket is deleted and no longer lists the ticket' do
    ticket = create(:ticket)
    log_in_as(admin)
    click_on 'Dashboard'
    click_on ticket.name
    click_on 'Delete'
    expect(page.body).to have_text('Ticket ' + ticket.id.to_s + ' was deleted.')
    expect(page.body).to_not have_link(ticket.name)
  end
end
