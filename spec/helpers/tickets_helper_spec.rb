require 'rails_helper'

RSpec.describe TicketsHelper, type: :helper do
  describe '#format_phone_number' do
    it 'formats a valid, but poorly formatted phone number correctly' do
      input_phone_number = '54 1-555, 1---23/4_'
      expected_formatted_phone_number = '+15415551234'
      formatted_phone_number = format_phone_number(input_phone_number)
      expect(formatted_phone_number).to eq(expected_formatted_phone_number)
    end

    it 'gives nil if input is invalid' do
      input_phone_number = 'test phrase'
      expected_formatted_phone_number = nil
      formatted_phone_number = format_phone_number(input_phone_number)
      expect(formatted_phone_number).to eq(expected_formatted_phone_number)
    end

  end
end
