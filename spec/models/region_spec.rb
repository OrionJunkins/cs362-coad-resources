require 'rails_helper'

RSpec.describe Region, type: :model do
  #let (region.new)
  it 'exists' do
    Region.new
  end

  it 'has a name' do
    region = Region.new
    expect(region).to respond_to(:name)
  end
end
