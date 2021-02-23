require 'rails_helper'

RSpec.describe 'Viewing regions', type: :feature do

  let(:admin) {create(:user, :admin)}

  specify 'shows a list of region names' do
    region = Region.create(name: 'Fake Region 1')
    log_in_as(admin)
    visit regions_path
    expect(page.body).to have_text(region.name)
  end

end
 