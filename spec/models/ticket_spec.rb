require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do 
    create(:ticket)
  end

  describe 'attributes:' do

    it 'has a name' do 
      expect(ticket).to respond_to(:name)
    end
  
    it 'has a description' do 
      expect(ticket).to respond_to(:description)
    end
  
    it 'has a phone' do 
      expect(ticket).to respond_to(:phone)
    end
  
    it 'has an organization_id' do 
      expect(ticket).to respond_to(:organization_id)
    end
  
    it 'has a closed status' do 
      expect(ticket).to respond_to(:closed)
    end
  
    it 'has a closed at time' do 
      expect(ticket).to respond_to(:closed_at)
    end
  
    it 'has a resource_category_id' do 
      expect(ticket).to respond_to(:resource_category_id)
    end
  
    it 'has a region_id' do 
      expect(ticket).to respond_to(:region_id)
    end

  end

  describe 'validation behavior:' do

    it { should validate_presence_of(:name) } 
    it { should validate_length_of(:name).is_at_least(1).on(:create) } 
    it { should validate_length_of(:name).is_at_most(255).on(:create) }
    it { should validate_presence_of(:phone) }

    it { should validate_length_of(:description).is_at_most(1020).on(:create) }

    it 'is invalid without a valid phone number' do
      expect(ticket.valid?).to be_truthy
      ticket.phone = 'kittens'
      expect(ticket.valid?).to be_falsey
    end

  end

  describe 'associations:' do
    it 'belongs to a region' do
      should belong_to(:region)
    end

    it 'belongs to a resource_category' do
      should belong_to(:resource_category)
    end

    it 'may belong to an organization' do
      should belong_to(:organization).optional
    end

  end

  describe 'behavior:' do 

    it 'has a string representation of its name' do
      ticket_string = "Ticket #{ticket.id}"
      str_rep = ticket.to_s
      expect(str_rep).to eq(ticket_string)
    end

    it 'can be queried to see if it is open or closed' do 
      ticket.closed = true
      expect(ticket.open?).to be_falsey
      ticket.closed = false
      expect(ticket.open?).to be_truthy
    end

    it 'can be queried to see if it has an organization' do 
      expect(ticket.captured?).to be_falsey
      ticket.organization = Organization.new
      expect(ticket.captured?).to be_truthy
    end

  end

  describe 'scopes: ' do
    describe 'closed' do 
      let(:closed_ticket) do
        create(:ticket, :closed)
      end

      let(:open_ticket) do
        create(:ticket, :open)
      end

      it 'includes closed tickets' do
        expect(Ticket.closed).to include(closed_ticket)
      end

      it 'does not include open tickets' do
        expect(Ticket.closed).to_not include(open_ticket)
      end

    end

    describe 'open' do 
      let(:closed_ticket) do
        create(:ticket, :closed)
      end
      
      let(:open_ticket) do
        create(:ticket, :open)
      end

      it 'includes open tickets' do
        expect(Ticket.open).to include(open_ticket)
      end

      it 'does not include closed tickets' do
        expect(Ticket.open).to_not include(closed_ticket)
      end

    end



    describe 'all_organization' do 

      it 'includes open tickets with an organization' do
        captured_ticket = create(:ticket, :captured)
        captured_ticket.closed = false
        expect(Ticket.all_organization).to include(captured_ticket)
      end

      it 'returns not include a closed ticket' do 
        captured_ticket = create(:ticket, :captured, closed: true)
        expect(Ticket.all_organization).to_not include(captured_ticket)
      end

      it 'does not return a ticket without an organization' do
        ticket = create(:ticket, organization: nil, name: 'New Fake Ticket')
        ticket.closed = false
        expect(Ticket.all_organization).to_not include(ticket)
      end

    end


    describe 'organization' do

      it 'returns tickets with the correct organization_id' do
        captured_ticket = create(:ticket, :captured)
        organization_id = captured_ticket.organization_id
        expect(Ticket.organization(organization_id)).to include(captured_ticket)
      end

      it 'does not return tickets with the incorrect organization_id' do
        captured_ticket = create(:ticket, :captured)
        organization = captured_ticket.organization

        other_ticket = build(:ticket, :captured, name: "Other Fake Ticket")
        other_ticket.organization = create(:organization, name: 'New Fake Organization', email: "other@example.com") #TODO: Improve -> extract to factory?
        
        expect(Ticket.organization(organization.id)).to_not include(other_ticket)
      end

    end

    describe 'closed_organization' do
      
      it 'returns a closed, captured ticket' do
        captured_ticket = create(:ticket, :captured, closed: true)
        organization_id = captured_ticket.organization.id

        expect(Ticket.closed_organization(organization_id)).to include(captured_ticket)
      end

      it 'does not return an open ticket' do
        captured_ticket = create(:ticket, :captured, closed: false)
        organization_id = captured_ticket.organization.id

        expect(Ticket.closed_organization(organization_id)).to_not include(captured_ticket)
      end

    end

    describe 'region' do
      it 'returns a ticket if queried for that regions id' do
        ticket = create(:ticket)
        region = ticket.region
        expect(Ticket.region(region.id)).to include(ticket)
      end

      it 'does not return a ticket wit a different id' do
        ticket = create(:ticket)
        region = ticket.region

        other_ticket = build(:ticket, name: 'Distinct Region Fake Ticket')
        other_ticket.region = create(:region, name: 'Other Fake Region')
        other_ticket.save

        expect(Ticket.region(region.id)).to include(ticket)
      end

    end

    describe 'organization' do
      
    end


  end

end
