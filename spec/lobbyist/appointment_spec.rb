require 'spec_helper'

describe Lobbyist::Appointment do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of appointments' do
      VCR.use_cassette('appointment_list') do
        appointments = Lobbyist::Appointment.list({company_id: 5909})

        expect(appointments).to_not be_nil
        expect(appointments.elements).to be_a(Array)
        expect(appointments.elements[0].first_name).to eq('oainsdf')
        expect(appointments.elements[1].first_name).to eq('testapp')
      end
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      VCR.use_cassette('appointment_find_error') do
        expect{Lobbyist::Appointment.find(2)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should return the found appointment' do
      VCR.use_cassette('appointment_find') do
        appointment = Lobbyist::Appointment.find('1')

        expect(appointment).to_not be_nil
        expect(appointment).to be_a(Lobbyist::Appointment)
        expect(appointment.email).to eq('scheurich5@comcast.net')
      end
    end
  end

  describe ':create' do
    it 'should create a new appointment' do
      VCR.use_cassette('appointment_create') do
        appointment = Lobbyist::Appointment.create(params)

        expect(appointment).to_not be_nil
        expect(appointment).to be_a(Lobbyist::Appointment)
        expect(appointment.first_name).to eq('Tom')
        expect(appointment.comments).to eq('Please come clean up.')
      end
    end
  end
  
  def params
    {
      'company_id'        => '127',
      'first_name'        => 'Tom',
      'last_name'         => 'Jerry',
      'email'             => 'tomjerry@gmail.com',
      'phone'             => '(876) 876-8765',
      'appointment_date1' => '2013-05-30 12:00 PM',
      'comments'          => 'Please come clean up.'
    }
  end
  
end