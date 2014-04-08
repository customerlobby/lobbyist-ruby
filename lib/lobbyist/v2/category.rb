module Lobbyist
  module V2
    
    class Category < Lobbyist::V2::Base
      attr_accessor :id, :name, :created_at, :updated_at
    end
    
  end
end
