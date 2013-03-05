require 'lobbyist/version'

spec = Gem::Specification.new do |s|
  s.name = 'lobbyist'
  s.version = Lobbyist::VERSION
  s.summary = 'Ruby client library for the Customer Lobby API.'
  s.description = 'Access the Customer Lobby API easily with this client. See documentation at ###TBD###'
  s.authors = ['David Lains', 'Shiv Indap', 'Sreevidya Allada']
  s.email   = ['dlains@customerlobby.com']
  s.homepage = 'TBD'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.require_paths = %w{lib}
  
  s.add_dependency('rest-client')
  s.add_dependency('json')
  
  s.add_development_dependency('rspec')
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
  s.has_rdoc = false
end