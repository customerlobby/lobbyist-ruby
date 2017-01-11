require 'spec_helper'

describe Lobbyist::V2::Customer do
  describe 'communication preferences helper methods' do
    @methods = {
      wants_email?:                0b000100010001,
      wants_call?:                 0b001000100010,
      wants_sms?:                  0b010001000100,
      wants_mail?:                 0b100010001000,
      direct_connect_wants_email?: 0b000000000001,
      direct_connect_wants_call?:  0b000000000010,
      direct_connect_wants_sms?:   0b000000000100,
      direct_connect_wants_mail?:  0b000000001000,
      member_wants_email?:         0b000000010000,
      member_wants_call?:          0b000000100000,
      member_wants_sms?:           0b000001000000,
      member_wants_mail?:          0b000010000000,
      customer_wants_email?:       0b000100000000,
      customer_wants_call?:        0b001000000000,
      customer_wants_sms?:         0b010000000000,
      customer_wants_mail?:        0b100000000000
    }

    @methods.each do |method_name, flag|
      it 'should return true if the flag is set' do
        contact = Lobbyist::Contact.new({communication_preferences: flag})
        expect(contact.send(method_name)).to eq(true)
      end

      it 'should return false if the flag is unset' do
        contact = Lobbyist::Contact.new({communication_preferences: 0b000000000000})
        expect(contact.send(method_name)).to eq(false)
      end
    end
  end
end
