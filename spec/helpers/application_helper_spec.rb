require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    it 'gives base title if called with no param' do 
      full_page_title = full_title()
      expect(full_page_title).to eq('Disaster Resource Network')
    end
    
    it 'gives a combined title if called with a normal page title' do 
      page_title = 'Fake Page'
      expected_full_title = 'Fake Page | Disaster Resource Network'
      full_page_title = full_title(page_title)
      expect(full_page_title).to eq(expected_full_title)
    end
  end
end
