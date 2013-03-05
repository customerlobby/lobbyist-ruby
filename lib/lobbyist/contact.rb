module Lobbyist
  class Contact < ApiResource

    attr_accessor :contact_id, :company_id, :first_name, :last_name
    attr_accessor :phone_daytime, :phone_alt, :email, :address1, :address2
    attr_accessor :city, :state, :zip, :country, :last_service_date, :notes
    attr_accessor :email_disturb_status, :unsubscribe_reason, :unsubscribed_at
    attr_accessor :exclude_referral_marketing, :exclude_retention_marketing
    attr_accessor :facebook_like, :facebook_login_review, :twitter_follow
    attr_accessor :date_added, :auto_review_id, :auto_invite_id, :auto_customer_call_id
    attr_accessor :auto_review_draft_id, :facebook_uid, :facebook_access_token
    attr_accessor :facebook_session_key
    
    alias :id :contact_id
    
    def initialize(id = nil)
      @contact_id = id if id
    end
    
    def self.search(params = nil)
      return self.create_from(Lobbyist.request(:get, url + '/search.json', nil, params))
    end
    
    def self.find(id)
      instance = self.new(id)
      response = Lobbyist.request(:get, instance.url(id), nil, {'id' => id})
      instance.refresh_from(response)
      return instance
    end
    
    def self.find_all(params = nil)
      return self.create_from(Lobbyist.request(:get, url, nil, params))
    end
    
    def self.create(params = {})
      contact = { 'contact' => params }
      return self.create_from(Lobbyist.request(:post, "#{url}.json", nil, contact))
    end

    def update(params = {})
      contact = { 'contact' => params }
      return refresh_from(Lobbyist.request(:put, "#{url(id)}.json", id, contact))
    end
    
    def delete
      return refresh_from(Lobbyist.request(:delete, "#{url(id)}.json", id))
    end
    
    def refresh_from(response)
      return Contact.instantiate(response['contact'], self)
    end

    protected

    def self.create_from(response)
      if response.has_key?('contact')
        # Create a single contact.
        return self.instantiate(response['contact'])
      elsif response.has_key?('contacts')
        # Create a list of contacts.
        list = [];
        response['contacts'].each do |contact|
          list << self.instantiate(contact)
        end
        return list
      end

      return nil;
    end

    def self.instantiate(data, instance = nil)
      if(!data.empty?)
        instance ||= self.new
        
        Contact.instance_methods.each do |m|
          if(data.has_key?(m.to_s))
            instance.send "#{m}=".to_sym, data.fetch("#{m.to_s}")
          end
        end
        return instance
      end
      return nil
    end

  end

end