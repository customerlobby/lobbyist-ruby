require 'spec_helper'

describe Lobbyist::Promo do
  
  before(:all) do
    Lobbyist::Base.nonce = Time.now.utc.to_s
    @nonce = Lobbyist::Base.nonce
  end

  describe ':list' do
    it 'should get a list of active promos' do
      VCR.use_cassette('promo_list') do
        list = Lobbyist::Promo.list()
        expect(list).to be_a(Array)
        expect(list.count).to eq(168)
      end
    end
    
  end
  
  describe ':update' do

    it 'should update a promo' do
      VCR.use_cassette('promo_update') do
        promo_up = Lobbyist::Promo.update(25, {'visible' => 1})
        expect(promo_up).to_not be_nil
        expect(promo_up).to be_a(Lobbyist::Promo)
        expect(promo_up.visible).to eq(true)
      end
    end
  end

  describe ':create' do

    it 'should create a new promo' do
      VCR.use_cassette('promo_create') do
        promo = Lobbyist::Promo.create(params)

        expect(promo).to_not be_nil
        expect(promo).to be_a(Lobbyist::Promo)
        expect(promo.promo_code).to eq('promo_new')
      end
    end
  end

  def params
    {
      account_level_id: 2,
      code: "promo_new",
      description: "promo_new",
      status: 'active',
      visible: 1,
      setup_fee: 0,
      monthly_fee: 0,
    }
  end
end
