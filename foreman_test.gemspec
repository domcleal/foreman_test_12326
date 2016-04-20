require File.expand_path('../lib/foreman_test/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'foreman_test'
  s.version     = ForemanTest::VERSION
  s.date        = Date.today.to_s
  s.authors     = ['Your name']
  s.email       = ['Your email']
  s.homepage    = 'http://trada.com'
  s.summary     = 'Summary of ForemanTest.'
  # also update locale/gemspec.rb
  s.description = 'Description of ForemanTest.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

end
