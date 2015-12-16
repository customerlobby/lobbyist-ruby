require 'spec_helper'

describe Lobbyist::V2::Admin::CommunicationPiece do
  before :all do
    @headers = set_v2_headers
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
      VCR.use_cassette('v2/admin/communication_piece_list') do
        sut = Lobbyist::V2::Admin::CommunicationPiece.list(1)

        expect(sut).to be_a(Lobbyist::Collection)
        expect(sut.elements[0].status).to eq('in_transit')
      end
    end
  end

  describe "#destroy" do
    it 'should return a communication piece' do
      VCR.use_cassette('v2/admin/communication_piece_destroy') do
        sut = Lobbyist::V2::Admin::CommunicationPiece.destroy(1,1)

        expect(sut).to be_a(Lobbyist::V2::Admin::CommunicationPiece)
      end
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
