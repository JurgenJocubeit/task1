# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'calculator'
  s.version     = '1.0.0'
  s.date        = '2019-05-16'
  s.summary     = 'Calculator'
  s.description = 'Task 1 Solution'
  s.authors     = 'Jurgen Jocubeit'
  s.email       = 'jurgen@example.com'
  s.files       = ['lib/calculator.rb']
  s.homepage    = 'https://github.com/JurgenJocubeit/task1'
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end
