require 'spec_helper'

describe Lobbyist::SocialNetworkProfile do
  
  describe '#find_by_type_and_page_uid' do
    
    it 'should find the social network profile' do
      profile = Lobbyist::SocialNetworkProfile.search({'type' => 'FacebookProfile', 'page_uid' => '115376645304724'})
      profile.should be_a(Array)
      profile[0].page_tab_company_id.should == 17174
    end
  end

end