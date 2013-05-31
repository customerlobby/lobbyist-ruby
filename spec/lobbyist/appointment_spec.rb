require 'spec_helper'

describe Lobbyist::Appointment do
  
  describe ':list' do
    it 'should get a list of appointments' do
      list = Lobbyist::Appointment.list({ 'company_id' => '127' })
      list.should be_a(Array)
      list[0].first_name.should_not be_nil
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      expect{Lobbyist::Appointment.find('127', 'invalid')}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found appointment' do
      appointment = Lobbyist::Appointment.find('127', '99')
      appointment.should_not be_nil
      appointment.should be_a(Lobbyist::Appointment)
      appointment.company.should_not be_nil
      appointment.company.should be_a(Lobbyist::Company)
    end
  end
  
  describe ':create' do
    after do
      Lobbyist::Appointment.destroy(@created.id)
    end
    
    it 'should create a new appointment' do
      @created = Lobbyist::Appointment.create('127', {
        'first_name'        => 'Tom',
        'last_name'         => 'Jerry',
        'email'             => 'tomjerry@gmail.com',
        'phone'             => '(876) 876-8765',
        'appointment_date1' => '2013-05-30 12:00 PM',
        'comments'          => 'Please come clean up.'
      })
      @created.should_not be_nil
      @created.should be_a(Lobbyist::Appointment)
      @created.first_name.should == 'Tom'
      @created.comments.should == 'Please come clean up.'
      @created.company.should_not be_nil
    end
  end
  
end