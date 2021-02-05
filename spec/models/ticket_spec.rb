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

end
