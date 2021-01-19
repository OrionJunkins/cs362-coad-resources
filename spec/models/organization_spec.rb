require 'rails_helper'

RSpec.describe Organization, type: :model do
  let (:organization) do 
    Organization.new
  end
  it 'has a name' do
    expect(organization).to respond_to(:name)
  end

  it 'has a status' do
    expect(organization).to respond_to(:status)
  end

  it 'has a phone' do
    expect(organization).to  respond_to(:phone)
  end

  it 'has an email' do
    expect(organization).to respond_to(:email)
  end

  it 'has a description' do
    expect(organization).to  respond_to(:description)
  end

  it 'has a rejection_reason' do
    expect(organization).to  respond_to(:rejection_reason)
  end
  
  it 'has liability_insurance' do
    expect(organization).to  respond_to(:liability_insurance)
  end

  it 'has a primary name' do
    expect(organization).to  respond_to(:primary_name)
  end

  it 'has a secondary name' do
    expect(organization).to  respond_to(:secondary_name)
  end

  it 'has a secondary phone' do
    expect(organization).to  respond_to(:secondary_phone)
  end

  it 'has a title' do
    expect(organization).to  respond_to(:title)
  end

  it 'has transportation' do
    expect(organization).to  respond_to(:transportation)
  end

  it 'has all agreements' do
    agreements = [:agreement_one, :agreement_two, :agreement_three, :agreement_four, :agreement_five, :agreement_six, :agreement_seven, :agreement_eight]
    
    for agreement in agreements do
      expect(organization).to respond_to(agreement)
    end   

  end
end
