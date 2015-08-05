module Lobbyist
  class Version
    MAJOR = 0 unless defined? Lobbyist::Version::MAJOR
    MINOR = 5 unless defined? Lobbyist::Version::MINOR
    PATCH = 35 unless defined? Lobbyist::Version::PATCH

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end

    end

  end
end
