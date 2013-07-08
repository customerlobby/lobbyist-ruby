require 'spec_helper'

describe Lobbyist::AccountLevel do
  
  before(:all) do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get the list of account levels' do
      path = '/v1/account_levels.json'
      params = {'nonce' => @nonce}
      headers = set_headers('get', path, params)
      body = [{account_class_id: 1, account_class: 'basic', description: 'basic', call_credit_cost: 0,default_promo_id: 0,enabled: 1, monthly_call_credit_allowance: 0,
      ccall_credits_accumulate: 0,monthly_handwritten_credit_allowance: 0,handwritten_credits_accumulate: 0,conversion_handwritten_credit_grant: 0,conversion_ccall_credit_grant: 0},
      {account_class_id: 2, account_class: 'business', description: 'business', call_credit_cost: 0,default_promo_id: 0,enabled: 1, monthly_call_credit_allowance: 0,
      ccall_credits_accumulate: 0,monthly_handwritten_credit_allowance: 0,handwritten_credits_accumulate: 0,conversion_handwritten_credit_grant: 0,conversion_ccall_credit_grant: 0},
    {account_class_id: 3, account_class: 'free', description: 'free', call_credit_cost: 0,default_promo_id: 0,enabled: 1, monthly_call_credit_allowance: 0,
      ccall_credits_accumulate: 0,monthly_handwritten_credit_allowance: 0,handwritten_credits_accumulate: 0,conversion_handwritten_credit_grant: 0,conversion_ccall_credit_grant: 0}]
      stub_get(path).with(:query => params, headers => headers).to_return(body: body.to_json, status: 200)
      account = Lobbyist::AccountLevel.list(params)

      account.should_not be_nil
      account.should be_a(Array)
      account[0].account_class.should == 'basic'
      
    end
    
  end
  
end
