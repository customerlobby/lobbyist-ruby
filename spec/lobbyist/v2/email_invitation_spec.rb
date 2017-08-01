require 'spec_helper'

describe Lobbyist::V2::EmailInvitation do

  describe '#update' do
    it 'should update an email invitation' do
      VCR.use_cassette('v2/email_invitation_update') do
        id = 1
        key = '123456key'
        invitation = Lobbyist::V2::EmailInvitation.update(id, email_key: key)

        expect(invitation).to_not be_nil
        expect(invitation).to be_a(Lobbyist::V2::EmailInvitation)
        expect(invitation.email_key).to eq(key)
      end
    end
  end

  describe '#find_by_email_key' do
    it 'should fail with status 404 if the email key is not valid' do
      VCR.use_cassette('v2/email_invitation_find_by_invalid_email_key') do
        expect{Lobbyist::V2::EmailInvitation.find_by_email_key(1)}.to raise_error(Lobbyist::Error::NotFound)
      end
    end

    it 'should find an email invitation by email key' do
      VCR.use_cassette('v2/email_invitation_find_by_email_key') do
        id = 1
        key = '123456key'
        invitation = Lobbyist::V2::EmailInvitation.find_by_email_key(key)

        expect(invitation).to_not be_nil
        expect(invitation).to be_a(Lobbyist::V2::EmailInvitation)
        expect(invitation.id).to eq(id)
        expect(invitation.email_key).to eq(key)
      end
    end
  end

end
