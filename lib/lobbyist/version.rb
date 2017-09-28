module Lobbyist
  class Version
    MAJOR = 0 unless defined? Lobbyist::Version::MAJOR
    MINOR = 7 unless defined? Lobbyist::Version::MINOR
    PATCH = 46 unless defined? Lobbyist::Version::PATCH

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
    end
  end
end
