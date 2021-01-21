require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do 
    Ticket.new
  end

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
