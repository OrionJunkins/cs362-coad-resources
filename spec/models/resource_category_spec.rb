require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) do
    build(:resource_category)
  end


  describe 'attributes:' do

    it 'has a name' do
      expect(resource_category).to respond_to(:name)
    end
  
    it 'has an active status' do
      expect(resource_category).to respond_to(:active)
    end
  end


  describe 'validation behavior:' do
    it { should validate_presence_of(:name) } 
    it { should validate_length_of(:name)
    .is_at_least(1)
    .is_at_most(255)
    .on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive } 
  end

  describe 'associations:' do

    it 'has many tickets' do
      should have_many(:tickets)
    end

  end

  describe 'behavior:' do 

    it 'has a string representation of its name' do
      name = resource_category.name
      str_rep = resource_category.to_s
      expect(str_rep).to eq(name)
    end

    it 'can have an unspecified resource category' do 
      expect(ResourceCategory.unspecified.to_s). to eq('Unspecified')
    end

    it 'has an inactive? method that gives state' do
      resource_category.active = false
      expect(resource_category.inactive?).to be_truthy
    end

    it 'can be activated' do 
      resource_category.active = false
      resource_category.activate
      expect(resource_category.active).to be_truthy
    end

    it 'can be deactivated' do 
      resource_category.active = true
      resource_category.deactivate
      expect(resource_category.active).to be_falsey
    end

  end

  describe 'scopes:' do 
    it 'gives active RCs with no inactive ones' do
      rc = ResourceCategory.create(name:"Fake", active: true) #TODO Replace with factory
      expect(ResourceCategory.active.include?(rc)).to be_truthy
      expect(ResourceCategory.inactive.include?(rc)).to be_falsey
    end
  end
end