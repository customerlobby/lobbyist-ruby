lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lobbyist/version'

spec = Gem::Specification.new do |s|
  s.name                  = 'lobbyist-ruby'
  s.version               = Lobbyist::Version
  s.summary               = 'Ruby client library for the Customer Lobby API.'
  s.description           = 'Access the Customer Lobby API easily with this client. See documentation at ###TBD###'
  s.authors               = ['David Lains', 'Shiv Indap']
  s.email                 = ['dlains@customerlobby.com', 'sindap@customerlobby.com']
  s.homepage              = 'https://github.com/customerlobby/lobbyist-ruby'
  s.licenses              = ['MIT']
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.require_paths         = ['lib']
  s.files                 = `git ls-files`.split("\n")
  s.test_files            = `git ls-files -- spec/*`.split("\n")
  s.has_rdoc              = false
  
  s.add_dependency('faraday')
  s.add_dependency('faraday_middleware')
  s.add_dependency('multi_json')
  s.add_dependency('activesupport')
  s.add_dependency('hashie')
  
  s.add_development_dependency('vcr')
  s.add_development_dependency('bundler')
end
