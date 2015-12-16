require 'spec_helper'

describe Lobbyist::AdminPerformanceEvent do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':create' do
    it 'should create a new admin performance event' do
      VCR.use_cassette('admin_performance_event_create') do
        event = Lobbyist::AdminPerformanceEvent.create(params)
  
        expect(event.name).to eq("completed")
        expect(event.entity_type).to eq("CustomerCall")
      end
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