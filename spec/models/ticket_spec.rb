require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do 
    Ticket.new
  end

  it 'exists' do 
    ticket
  end

end

