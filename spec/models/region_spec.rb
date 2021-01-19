require 'rails_helper'

RSpec.describe Region, type: :model do
  let (:region) do
    Region.new 
  end

  it 'exists' do
    region
  end

  it 'has a name' do
    expect(region).to respond_to(:name)
  end

  
end
