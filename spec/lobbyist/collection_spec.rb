require 'spec_helper'

describe Lobbyist::Collection do

  describe ".sum" do
    before do
      @companies = []
      @companies << Lobbyist::V2::Company.new({ id: 1, company_name: "a", city: "x"})
      @companies << Lobbyist::V2::Company.new({ id: 2, company_name: "a", city: "y"})
      @companies << Lobbyist::V2::Company.new({ id: 3, company_name: "b", city: "z"})
    end

    it 'should raise no method error if column does not exist' do
      collection = Lobbyist::Collection.new(@companies)

      expect { collection.sum('does_not_exist') }.to raise_error(NoMethodError)
    end

    it 'should return 0 if column is not a number' do
      collection = Lobbyist::Collection.new(@companies)

      sut = collection.sum('company_name')

      sut.should eq 0
    end

    it "should return sum of the element column" do
      collection = Lobbyist::Collection.new(@companies)

      sut = collection.sum('id')

      sut.should eq 6.0
    end

    context "with conditions parameters" do
      it 'should return sum of the element column' do
        collection = Lobbyist::Collection.new(@companies)

        sut = collection.sum('id', company_name: 'a')

        sut.should eq 3

        sut = collection.sum('id', company_name: 'b')

        sut.should eq 3
      end

      it 'should return sum given multiple parameters' do
        @companies << Lobbyist::V2::Company.new({ id: 4, company_name: "a", city: "x"})
        @companies << Lobbyist::V2::Company.new({ id: 5, company_name: "b", city: "y"})
        @companies << Lobbyist::V2::Company.new({ id: 6, company_name: "b", city: "z"})
        @companies << Lobbyist::V2::Company.new({ id: 7, company_name: "a", city: "x"})

        collection = Lobbyist::Collection.new(@companies)

        sut = collection.sum('id', company_name: 'a', city: 'x')

        sut.should eq 12

        sut = collection.sum('id', company_name: 'b', city: 'y')

        sut.should eq 5

        sut = collection.sum('id', company_name: 'b', city: 'z')

        sut.should eq 9
      end

      it 'should raise No method error given condition key does not exist' do
        collection = Lobbyist::Collection.new(@companies)
        expect { collection.sum('id', does_not_exist: 'a') }.to raise_error(NoMethodError)
      end
    end


    context "using different entity" do
      before do
        @campaign_iterations = []
        @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 1, status: "completed", communication_campaign_id: 1})
        @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 2, status: "in_progress", communication_campaign_id: 2})
        @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 3, status: "completed", communication_campaign_id: 2})
      end

      it 'should raise a No method error if column does not exist' do
        collection = Lobbyist::Collection.new(@campaign_iterations)

        expect { collection.sum('does_not_exist') }.to raise_error(NoMethodError)
      end

      it 'should return 0 if column is not a number' do
        collection = Lobbyist::Collection.new(@campaign_iterations)

        sut = collection.sum('status')

        sut.should eq 0
      end

      it "should return sum of the element column" do
        collection = Lobbyist::Collection.new(@campaign_iterations)

        sut = collection.sum('roi')

        sut.should eq 6.0
      end

      context "with condition parameters" do
        it 'should return sum of the element column' do
          collection = Lobbyist::Collection.new(@campaign_iterations)

          sut = collection.sum('roi', status: 'completed')

          sut.should eq 4

          sut = collection.sum('roi', status: 'in_progress')

          sut.should eq 2
        end

        it 'should return sum given multiple parameters' do
          @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 4, status: "in_progress", communication_campaign_id: 1})
          @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 5, status: "completed", communication_campaign_id: 1})
          @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 6, status: "completed", communication_campaign_id: 3})
          @campaign_iterations << Lobbyist::V2::CampaignIteration.new({ roi: 7, status: "in_progress", communication_campaign_id: 2})

          collection = Lobbyist::Collection.new(@campaign_iterations)

          sut = collection.sum('roi', status: 'completed', communication_campaign_id: 1)

          sut.should eq 6

          sut = collection.sum('roi', status: 'in_progress', communication_campaign_id: 2)

          sut.should eq 9

          sut = collection.sum('roi', status: 'completed', communication_campaign_id: 3)

          sut.should eq 6
        end

        it 'should raise No method error given condition key does not exist' do
          collection = Lobbyist::Collection.new(@campaign_iterations)
          expect { collection.sum('roi', does_not_exist: 'a') }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
