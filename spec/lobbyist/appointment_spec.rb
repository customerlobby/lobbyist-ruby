require 'spec_helper'

describe Lobbyist::Appointment do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of appointments' do
      path = '/v1/appointments.json'
      params = {'nonce' => @nonce}
      headers = set_headers('get', path, params)
      body = [{id: 1, company_id: 3, first_name: 'John', last_name: 'Doe', email: 'jdoe@gmail.com', phone: '(944) 234-4433', appointment_date1: Time.now, comments: 'Appointment Comments'},{id: 2, company_id: 3, first_name: 'Jane', last_name: 'Doe', email: 'jane@gmail.com', phone: '(777) 888-9999', appointment_date1: Time.now, comments: 'Appointment Comments 1'}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      appointments = Lobbyist::Appointment.list(params)

      appointments.should_not be_nil
      appointments.should be_a(Array)
      appointments[0].first_name.should == 'John'
      appointments[1].first_name.should == 'Jane'
    end
  end
  
  describe ':find' do
    it 'should fail with status 404 if the id is not valid' do
      headers = set_headers('get', path(999), {'nonce' => @nonce})
      body = {errors: ["Unable to find appointment with that id."]}
      stub_get(path(999)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 404)
      expect{Lobbyist::Appointment.find(999)}.to raise_error(Lobbyist::Error::NotFound)
    end
    
    it 'should return the found appointment' do
      headers = set_headers('get', path(99), {'nonce' => @nonce})
      body = {id: 1, company_id: 3, first_name: 'John', last_name: 'Doe', email: 'jdoe@gmail.com', phone: '(944) 234-4433', appointment_date1: Time.now, comments: 'Appointment Comments'}
      stub_get(path(99)).with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      appointment = Lobbyist::Appointment.find('99')

      appointment.should_not be_nil
      appointment.should be_a(Lobbyist::Appointment)
    end
  end
  
  describe ':create' do
    
    it 'should create a new appointment' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'appointment' => params})
      headers = set_headers('post', path, {'nonce' => @nonce})
      body = {id: 1, company_id: 3, first_name: 'Tom', last_name: 'Jerry', email: 'tomjerry@gmail.com', phone: '(876) 876-8765', appointment_date1: Time.now, comments: 'Please come clean up.'}
      stub_post(path).with(:query => {'nonce' => @nonce, 'appointment' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      appointment = Lobbyist::Appointment.create(params)
      
      appointment.should_not be_nil
      appointment.should be_a(Lobbyist::Appointment)
      appointment.first_name.should == 'Tom'
      appointment.comments.should == 'Please come clean up.'
    end
  end
  
  def path(id = nil)
    if id
      "/v1/appointments/#{id}.json"
    else
      "/v1/appointments.json"
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