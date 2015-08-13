require 'spec_helper'

describe Lobbyist::Collection do

  describe ".sum" do
    before do
      @companies = []
      @companies << Lobbyist::V2::Company.new({ id: 1, company_name: "a"})
      @companies << Lobbyist::V2::Company.new({ id: 2, company_name: "a"})
      @companies << Lobbyist::V2::Company.new({ id: 3, company_name: "b"})
    end

    it 'should return nil if column does not exist' do
      collection = Lobbyist::Collection.new(@companies)

      sut = collection.sum('does_not_exist')

      sut.should eq nil
    end

    it 'should return nil if column is not a number' do
      collection = Lobbyist::Collection.new(@companies)

      sut = collection.sum('company_name')

      sut.should eq nil
    end

    it "should return sum of the element column" do
      collection = Lobbyist::Collection.new(@companies)

      sut = collection.sum('id')

      sut.should eq 6.0
    end

    context "with key value parameters" do
      it 'should return sum of the element column' do
        collection = Lobbyist::Collection.new(@companies)

        sut = collection.sum('id', 'company_name', 'a')

        sut.should eq 3

        sut = collection.sum('id', 'company_name', 'b')

        sut.should eq 3
      end
    end

    context "using different entity" do
      before do
        @campaign_iterations = []
        @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 1, status: "completed"})
        @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 2, status: "in_progress"})
        @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 3, status: "completed"})
      end

      it 'should return nil if column does not exist' do
        collection = Lobbyist::Collection.new(@campaign_iterations)

        sut = collection.sum('does_not_exist')

        sut.should eq nil
      end

      it 'should return nil if column is not a number' do
        collection = Lobbyist::Collection.new(@campaign_iterations)

        sut = collection.sum('status')

        sut.should eq nil
      end

      it "should return sum of the element column" do
        collection = Lobbyist::Collection.new(@campaign_iterations)

        sut = collection.sum('roi')

        sut.should eq 6.0
      end

      context "with key value parameters" do
        it 'should return sum of the element column' do
          collection = Lobbyist::Collection.new(@campaign_iterations)

          sut = collection.sum('roi', 'status', 'completed')

          sut.should eq 4

          sut = collection.sum('roi', 'status', 'in_progress')

          sut.should eq 2
        end
      end
    end
  end
end
