require 'rails_helper'

RSpec.describe 'Viewing a ticket', type: :feature do

  let(:admin) {create(:user, :admin)}
  let(:ticket) {create(:ticket)}
  let(:second_ticket) {create(:ticket)}
  before do
    ticket
    second_ticket
  end

  specify 'shows the details of a selected ticket' do
    log_in_as(admin)
    focused_ticket = ticket
    visit dashboard_path
    within "li#ticket_#{ticket.id}" do
      click_on focused_ticket.name
    end

    expect(page.body).to have_text(focused_ticket.description)
    expect(page.body).to have_selector('h1', text: "Ticket #{focused_ticket.id}")
  end

end
 