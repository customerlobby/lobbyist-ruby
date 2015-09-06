require 'spec_helper'

describe Lobbyist::V2::Admin::CommunicationPiece do
  before :all do
    Lobbyist.api_base = "http://localhost:3000"
    Lobbyist.api_key  = "jQuchd091cns"
    Lobbyist.api_secret  = "acjbdkcsdbcksdbck92017jascalscbalscjbcalb"
    @headers = {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Token token="jQuchd091cns"', 'User-Agent'=>'Faraday v0.8.7'}
  end

  describe "initiliaze" do
    let(:sut) { Lobbyist::V2::Admin::CommunicationPiece.new({}) }
    subject { sut }

    it { should respond_to :id }
    it { should respond_to :customer_first_name }
    it { should respond_to :customer_last_name }
    it { should respond_to :customer_address1 }
    it { should respond_to :customer_address2 }
    it { should respond_to :customer_city }
    it { should respond_to :customer_state }
    it { should respond_to :customer_zip }
    it { should respond_to :status }
    it { should respond_to :verification_errors }
    it { should respond_to :uuid }
  end

  describe "#list" do
    it 'should return list of Communication pieces' do
      stub_get('/v2/admin/campaign-iterations/1/communication-pieces.json').to_return(body: { items: [] }.to_json, status: 200)

      sut = Lobbyist::V2::Admin::CommunicationPiece.list(1)
      sut.should be_a Lobbyist::Collection
    end
  end

  describe "#destroy" do
    it 'should return a communication piece' do
      stub_delete('/v2/admin/campaign-iterations/1/communication-pieces/1.json').to_return(body: { communication_piece: { id: 1 } }.to_json, status: 200)

      sut = Lobbyist::V2::Admin::CommunicationPiece.destroy(1,1)
      sut.should be_a Lobbyist::V2::Admin::CommunicationPiece
    end
  end

  describe "#update" do
    it 'should return a communication piece' do
      params = { communication_piece: { first_name: "sample" } }
      return_params = { communication_piece: { customer_first_name: "sample" } }
      stub_put('/v2/admin/campaign-iterations/1/communication-pieces/1.json').with(body: params).to_return(body: return_params.to_json, status: 200)

      communication_piece = Lobbyist::V2::Admin::CommunicationPiece.update(1,1, params)
      communication_piece.should be_a(Lobbyist::V2::Admin::CommunicationPiece)
    end
  end

  describe ".verification_error" do
    it "should return an value" do
      sut = Lobbyist::V2::Admin::CommunicationPiece.new({verification_errors: "---\n- sample"})

      expect(sut.verification_errors).to be_a Array
    end
  end

  describe ".verification_errors=" do
    it 'should set verification error value' do
      sut = Lobbyist::V2::Admin::CommunicationPiece.new({})
      sut.verification_errors = "---\n- value"
      expect(sut.verification_errors).to eq ["value"]
    end
  end
end
