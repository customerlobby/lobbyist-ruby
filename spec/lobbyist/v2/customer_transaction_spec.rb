require 'spec_helper'

describe Lobbyist::V2::CustomerTransaction do
  describe "initialize" do
    let(:sut) { Lobbyist::V2::CustomerTransaction.new({}) }
    subject { sut }

    it { should respond_to :id }
    it { should respond_to :communication_piece_id }
    it { should respond_to :uuid }
    it { should respond_to :contact_id }
    it { should respond_to :external_id }
    it { should respond_to :receipt_number }
    it { should respond_to :category }
    it { should respond_to :event }
    it { should respond_to :due_date }
    it { should respond_to :amount }
    it { should respond_to :is_paid }
    it { should respond_to :transacted_at }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
    it { should respond_to :customer_name }
    it { should respond_to :customer_address1 }
    it { should respond_to :customer_address2 }
    it { should respond_to :customer_city }
    it { should respond_to :customer_state }
    it { should respond_to :customer_zip }
  end
end
