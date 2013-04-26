require 'spec_helper'

describe Lobbyist do

  after do
    Lobbyist.reset!
  end

  describe ".respond_to?" do
    it "delegates to Lobbyist::Client" do
      expect(Lobbyist.respond_to?(:contact)).to be_true
    end
    it "takes an optional argument" do
      expect(Lobbyist.respond_to?(:client, true)).to be_true
    end
  end

  describe ".client" do
    it "returns a Lobbyist::Client" do
      expect(Lobbyist.client).to be_a Lobbyist::Client
    end

    context "when the options don't change" do
      it "caches the client" do
        expect(Lobbyist.client).to eq Lobbyist.client
      end
    end
    context "when the options change" do
      it "busts the cache" do
        client1 = Lobbyist.client
        Lobbyist.configure do |config|
          config.api_key = 'abc'
          config.api_secret = '123'
        end
        client2 = Lobbyist.client
        expect(client1).not_to eq client2
      end
    end
  end

  describe ".configure" do
    Lobbyist::Configurable.keys.each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        Lobbyist.configure do |config|
          config.send("#{key}=", key)
        end
        expect(Lobbyist.instance_variable_get(:"@#{key}")).to eq key
      end
    end

    context "when invalid credentials are provided" do
      it "raises a ConfigurationError exception" do
        expect {
          Lobbyist.configure do |config|
            config.api_key = [12345, 54321]
            config.api_secret = 'valid_data'
          end
        }.to raise_exception(Lobbyist::Error::ConfigurationError)
      end
    end

    context "when no credentials are provided" do
      it "does not raise an exception" do
        expect {
          Lobbyist.configure do |config|
            config.api_key = nil
            config.api_secret = nil
          end
        }.to_not raise_exception(Lobbyist::Error::ConfigurationError)
      end
    end
  end

  describe ".credentials?" do
    it "returns true if all credentials are present" do
      Lobbyist.configure do |config|
        config.api_key = 'APIKEY'
        config.api_secret = 'APISECRET'
      end
      expect(Lobbyist.credentials?).to be_true
    end
    it "returns false if any credentials are missing" do
      Lobbyist.configure do |config|
        config.api_key = 'APIKEY'
        config.api_secret = nil
      end
      expect(Lobbyist.credentials?).to be_false
    end
  end

end