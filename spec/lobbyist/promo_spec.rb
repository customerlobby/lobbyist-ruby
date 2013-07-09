require 'spec_helper'

describe Lobbyist::Promo do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of active promos' do
      params = {'nonce' => @nonce}
      headers = set_headers('get', '/v1/promos.json', params)
      body = [{promo_id: 1,account_level_id: 1 ,account_class: "basic", promo_code: "promo1" ,promo_description: "promo1",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0},
        {promo_id: 2,account_level_id: 1 ,account_class: "basic", promo_code: "promo1" ,promo_description: "promo1",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0}]
    
      stub_get('/v1/promos.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      list = Lobbyist::Promo.list()
      list.should be_a(Array)
      list.count.should == 2
    end
    
    # it 'should get a list of discontinued notices' do
    #    params = {'nonce' => @nonce}
    #   headers = set_headers('get', '/v1/promos.json', params)
    #   body = [{promo_id: 1,account_level_id: 1 ,account_class: "basic", promo_code: "promo1" ,promo_description: "promo1",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0},
    #     {promo_id: 2,account_level_id: 1 ,account_class: "basic", promo_code: "promo1" ,promo_description: "promo1",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0}]
    
    #   stub_get('/v1/promos.json').with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
    #   list = Lobbyist::Promo.list()
    #   list.should be_a(Array)
    #   list.count.should == 2
    # end
  end
  
  describe ':discontinue' do
    
    it 'should update a promo' do
      headers = set_headers('put', '/v1/promos/12/dismiss.json', {'nonce' => @nonce})
      params = {account_level_id: 1 ,account_class: "basic", promo_code: "promo1" ,promo_description: "promo1",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0}
      body = {promo_id: 12,account_level_id: 1 ,account_class: "basic", promo_code: "promo1" ,promo_description: "promo1",is_current: 0,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0}
      stub_put('/v1/promos/12/discontinue.json').with(:query => {'nonce' => @nonce}, headers => headers).to_return(body: body.to_json, status: 200)
      promo = Lobbyist::Promo.discontinue(12)
      promo.should_not be_nil
      promo.should be_a(Lobbyist::Promo)
      promo.is_current.should == 0
    end
  end
  
  describe ':create' do
    
    it 'should create a new promo' do
      path = '/v1/promos.json'
      params = {account_level_id: 2 ,account_class: "free", promo_code: "promo_new" ,promo_description: "promo_new",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0}
      body = {promo_id: 2000,account_level_id: 1 ,account_class: "basic", promo_code: "promo_new" ,promo_description: "promo1",is_current: 1,is_visible: 1,setup_fee: 0,monthly_fee: 0,first_month_fee: 0,split_activation_fee: 1 ,days_available: 0}
      headers = set_headers('post', path, {'nonce' => @nonce, 'promo' => params})
      headers = set_headers('post', path, {'nonce' => @nonce})
      stub_post(path).with(:query => {'nonce' => @nonce, 'promo' => params}, headers => headers).to_return(body: body.to_json, status: 200)
      promo = Lobbyist::Promo.create(params)
      
      promo.should_not be_nil
      promo.should be_a(Lobbyist::Promo)
      promo.promo_code.should == 'promo_new'
      
    end
  end
end
