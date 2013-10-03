require 'spec_helper'

describe Lobbyist::AdminPerformanceEvent do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':create' do
    
    it 'should create a new admin performance event' do
      headers = set_headers('post', path, {'nonce' => @nonce, 'admin_performance_event' => params})
      body = {id: 1, admin_user_id: 12, name: 'completed', entity_id: 152, entity_type: 'CustomerCall', created_at: Time.now.to_s, updated_at: Time.now.to_s}
      stub_post(path).with(:query => {'nonce' => @nonce, 'admin_performance_event' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      event = Lobbyist::AdminPerformanceEvent.create(params)
  
      event.name.should == "completed"
      event.entity_type.should == "CustomerCall"
    end
    
  end
  
  def path(id = nil)
    if id
      "/v1/admin_performance_events/#{id}.json"
    else
      "/v1/admin_performance_events.json"
    end
  end
  
  def params
    {
      "id"                      => 1,
      "admin_user_id"           => 12,
      "name"                    => 'completed',
      "entity_id"               => 152,
      "entity_type"             => "CustomerCall",
      "created_at"              => Time.now.to_s,
      "updated_at"              => Time.now.to_s
    }
  end
  
end