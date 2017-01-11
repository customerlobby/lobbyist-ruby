require 'spec_helper'

describe Lobbyist::Contact do

  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('contact_find_error') do
        expect{Lobbyist::Contact.find(2)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found contact' do
      VCR.use_cassette('contact_find') do
        contact = Lobbyist::Contact.find(6)

        expect(contact).to_not be_nil
        expect(contact).to be_a(Lobbyist::Contact)
        expect(contact.first_name).to eq('Tony')
      end
    end
  end

  describe ':create' do
    it 'should create a new contact' do
      VCR.use_cassette('contact_create') do
        contact = Lobbyist::Contact.create(127, params)

        expect(contact).to_not be_nil
        expect(contact).to be_a(Lobbyist::Contact)
        expect(contact.first_name).to eq('John')
        expect(contact.wants_emails).to eq(true)
      end
    end
  end

  describe ':update' do
    it 'should update the contact' do
      VCR.use_cassette('contact_update') do
        contact = Lobbyist::Contact.update(127, 7207156, {first_name: 'Jane'})

        expect(contact).to_not be_nil
        expect(contact).to be_a(Lobbyist::Contact)
        expect(contact.first_name).to eq('Jane')
      end
    end
  end

  describe ':search' do
    it 'should get a list of contacts' do
      VCR.use_cassette('contact_search') do
        list = Lobbyist::Contact.search({company_id: 127, email: 'jdoe@gmail.com'})

        expect(list).to be_a(Array)
        expect(list[0].wants_emails).to eq(true)
      end
    end
  end

  describe 'PUT unsubscribe' do
    it "should return the contact when it was unsubscribed" do
      VCR.use_cassette('contact_unsubscribe') do
        contact = Lobbyist::Contact.unsubscribe({company_id: 127, email: 'jdoe@gmail.com'})

        expect(contact.wants_emails).to eq(false)
      end
    end
  end

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

  def params
    {
      'first_name'          => 'John',
      'last_name'           => 'Doe',
      'email'               => 'jdoe@gmail.com',
      'wants_emails'        => '1',
    }
  end

end
