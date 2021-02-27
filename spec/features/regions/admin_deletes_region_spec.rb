require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:admin) {create(:user, :admin)}

  specify 'shows a list of region names' do
    region = create(:region)
    log_in_as(admin)
    click_on 'Regions'
    click_on region.name
    click_on 'Delete'
    #accept_alert()
    #expect(page.body).to have_text('Region successfully created.')
    #expect(page.body).to have_text(region_name)
  end
end
