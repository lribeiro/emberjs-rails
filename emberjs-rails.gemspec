# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "emberjs-rails/version"

Gem::Specification.new do |s|
  s.name        = "emberjs-rails"
  s.version     = "#{EmberJsRails::VERSION}"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joao Carlos", "James Harton"]
  s.email       = ["contact@kiskolabs.com", "james@sociable.co.nz"]
  s.homepage    = "https://github.com/jamesotron/emberjs-rails"
  s.summary     = "Ember.js for Rails 3.1."

  s.add_development_dependency "rails", ["~> 3.1"]

  s.files = %w(README.md) + Dir["lib/**/*", "vendor/**/*", "app/**/*"]

  s.require_paths = ["lib"]
end
