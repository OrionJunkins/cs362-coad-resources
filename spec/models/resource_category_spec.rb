require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) do
    ResourceCategory.new 
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
      name = "Fake name"
      resource_category.name = name
      str_rep = resource_category.to_s
      expect(str_rep).to eq(name)
    end

    it 'unspecified resource category exists upon search' do 
      expect(ResourceCategory.unspecified.to_s). to eq('Unspecified')
    end

  end


  
end
