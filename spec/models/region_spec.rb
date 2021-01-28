require 'rails_helper'

RSpec.describe Region, type: :model do
  let (:region) do
    Region.new 
  end
  
  describe 'attributes:' do
    it 'has a name' do
      expect(region).to respond_to(:name)
    end
  end

  describe 'validation behavior:' do
    it { should validate_presence_of(:name) } 
    it { should validate_length_of(:name).is_at_least(1) }
    it { should validate_length_of(:name).is_at_most(255) }
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
      region.name = name
      str_rep = region.to_s
      expect(str_rep). to eq(name)
    end

    it 'unspecified region exists upon search' do 
      Region.unspecified
      expect(Region.unspecified.to_s). to eq('Unspecified')
    end

  end

end
