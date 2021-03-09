require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:admin) {create(:user, :admin)}

  specify 'renders a notification after a region is deleted' do
    region = create(:region)
    log_in_as(admin)
    click_on 'Regions'
    click_on region.name
    click_on 'Delete'
    expect(page.body).to have_text('Region ' + region.name + ' was deleted.')
    expect(page.body).to_not have_link(region.name)
  end
end
