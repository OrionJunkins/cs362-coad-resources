require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe '#dashboard_for' do
    context 'admin user' do
      it 'returns admin_dashboard' do
        user = double()
        allow(user).to receive(:admin?).and_return(true)
        expect(dashboard_for(user)).to eq('admin_dashboard')
      end
    end

    context 'organization users with a submitted organization' do
      it 'returns organization_submitted_dashboard' do
        user = double()
        organization = double()
        allow(user).to receive(:admin?) {false}
        allow(user).to receive(:organization) {organization}
        allow(organization).to receive(:submitted?) {true}

        expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
      end
    end

    context 'organization users with an unsubmitted, approved organization' do
      it 'returns organization_approved_dashboard' do
        user = double()
        organization = double()
        allow(user).to receive(:admin?) {false}
        allow(user).to receive(:organization) {organization}
        allow(organization).to receive(:submitted?) {false}
        allow(organization).to receive(:approved?) {true}
        expect(dashboard_for(user)).to eq('organization_approved_dashboard')
      end
    end

    context 'organization users with an unsubmitted, unapproved organization' do
      it 'returns create_application_dashboard' do
        user = double()
        organization = double()
        allow(user).to receive(:admin?) {false}
        allow(user).to receive(:organization) {organization}
        allow(organization).to receive(:submitted?) {false}
        allow(organization).to receive(:approved?) {false}
        expect(dashboard_for(user)).to eq('create_application_dashboard')
      end
    end
    
  end
end
