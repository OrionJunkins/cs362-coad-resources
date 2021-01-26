require 'rails_helper'

RSpec.describe Organization, type: :model do
  let (:organization) do 
    Organization.new
  end

  describe 'attributes:' do
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

  describe 'validation behavior:' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(1) }
    it { should validate_length_of(:email).is_at_most(255) } 
    #TODO: Email format?
    #it { should validate_uniqueness_of(:email) } #Fails

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1) }
    it { should validate_length_of(:name).is_at_most(255) }
    #it { should validate_uniqueness_of(:name).scoped_to(:organization) } #Fails

    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }

    it { should validate_length_of(:description).is_at_most(1020) }
  end

  describe 'associations:' do

    it 'has many users' do
      should have_many(:users)
    end

    it 'has many tickets' do
      should have_many(:tickets)
    end

    #it 'has and belongs to many resource categories' do
     # should have_and_belongs_to_many(:resource_categories).optional #Optional?
    #end

  end

  describe 'behavior:' do 
    it 'status can be set to default' do
      organization.set_default_status
      expect(organization.status).to eq("submitted")
    end
    
    it 'status can be approved' do
      organization.set_default_status
      organization.approve
      expect(organization.status).to eq("approved") #why is this a string? Why not :approved?
    end

    it 'status can be rejected' do
      organization.set_default_status
      organization.reject
      expect(organization.status).to eq("rejected")
    end

    it 'has a string representation of its name' do
      name = "Fake name"
      organization.name = name
      str_rep = organization.to_s
      expect(str_rep). to eq(name)
    end
  end

end
