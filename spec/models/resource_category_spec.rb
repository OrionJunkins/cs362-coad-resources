require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let (:resource_category) do
    ResourceCategory.new 
  end

  it 'has a name' do
    expect(resource_category).to respond_to(:name)
  end

end
