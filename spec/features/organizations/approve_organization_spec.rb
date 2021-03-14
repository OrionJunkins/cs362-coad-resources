require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  
  let(:admin) {create(:user, :admin)}
  let(:organization) {create(:organization, :unapproved)}
  

  specify 'pending organization can be approved' do
    log_in_as(admin)
    
    expect(organization.status).to eq("submitted")
    click_on 'Organizations'
    click_on 'Pending'
    click_on organization.name
    click_on 'Approve'
    expect(page.body).to have_text('been approved')
  end
end
