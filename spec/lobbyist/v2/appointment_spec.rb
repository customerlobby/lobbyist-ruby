require 'spec_helper'

describe Lobbyist::V2::Appointment do

  describe ':create' do
    it 'should create a new appointment' do
      VCR.use_cassette('v2/appointment_create') do
        appointment = Lobbyist::V2::Appointment.create(params['company_id'], params)

        expect(appointment).to_not be_nil
        expect(appointment).to be_a(Lobbyist::V2::Appointment)
        expect(appointment.first_name).to eq(params['first_name'])
        expect(appointment.comments).to eq(params['comments'])
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
