module Lobbyist
  class Version
    MAJOR = 0 unless defined? Lobbyist::Version::MAJOR
    MINOR = 8 unless defined? Lobbyist::Version::MINOR
<<<<<<< HEAD
    PATCH = 97 unless defined? Lobbyist::Version::PATCH
=======
    PATCH = 96 unless defined? Lobbyist::Version::PATCH
>>>>>>> prospect changes

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
    end
  end
end
