# frozen_string_literal: true

require 'spec_helper'

describe Lobbyist::V2::SampleContact do
  describe '#find' do
    it 'should return the contact' do
      VCR.use_cassette('v2/sample_contact_find') do
        sample_contact = described_class.find(239)

        expect(sample_contact).to be_a(Lobbyist::V2::Contact)
        expect(sample_contact.name).to eq('Albert Nahman')
        expect(sample_contact.company_id).to eq(239)
      end
    end
  end

  describe '#create' do
    it 'should create and return sample_contact' do
      VCR.use_cassette('v2/sample_contact_create') do
        sample_contact = described_class.create(239, {})
        expect(sample_contact).to be_a(Lobbyist::V2::Contact)
      end
    end
  end

  describe '#update' do
    it 'should update and return sample_contact' do
      VCR.use_cassette('v2/sample_contact_update') do
        sample_contact = described_class.update(239, email: 'john@doe.com')

        expect(sample_contact).to be_a(Lobbyist::V2::Contact)
        expect(sample_contact.email).to eq('john@doe.com')
      end
    end
  end
end
