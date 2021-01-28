require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do 
    Ticket.new
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
    it { should validate_length_of(:name).is_at_least(1) } 
    it { should validate_length_of(:name).is_at_most(255) }

    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }  
    it { should validate_presence_of(:resource_category_id) } 

    it { should validate_length_of(:description).is_at_most(1020) }

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
      name = "Ticket 1"
      ticket.id = 1
      str_rep = ticket.to_s
      expect(str_rep).to eq(name)
    end

    it 'can be queried to see if it is open' do 
      tic = Ticket.new(closed: true)
      expect(tic.open?).to be_falsey
    end

    it 'can be queried to see if it has an organization' do 
      #tic = Ticket.new(captured: true)
      #expect(tic.captured?).to be_truthy
    end

  end

end
