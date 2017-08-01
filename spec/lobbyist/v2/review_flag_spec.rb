require 'spec_helper'

describe Lobbyist::V2::ReviewFlag do

  describe ':create' do
    it 'should create a new review flag' do
      VCR.use_cassette('v2/review_flag_create') do
        review_flag = Lobbyist::V2::ReviewFlag.create(params)

        expect(review_flag).to_not be_nil
        expect(review_flag).to be_a(Lobbyist::V2::ReviewFlag)
        expect(review_flag.review.review_id).to eq(params['review_id'])
        expect(review_flag.note).to eq(params['note'])
        expect(review_flag.flagged).to eq(params['flagged'])
      end
    end
  end

  def params
    {
      'review_id' => 10050,
      'category'  => 'reader_created',
      'note'      => 'some notes',
      'flagged'   => true,
    }
  end

end
