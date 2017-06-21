# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eol/version'

Gem::Specification.new do |spec|
  spec.name          = "eol"
  spec.version       = Eol::VERSION
  spec.authors       = ["Rob Roman"]
  spec.email         = ["rob@romancoding.com"]

  spec.summary       = "A comprehensive Encyclopedia of Life API wrapper"
  spec.description   = "A wrapper for the Encyclopedia of Life API.  It provides simple methods to call all of the available EOL API endpoints."
  spec.homepage      = "http://github.com/itroman/eol-ruby"
  spec.license       = "MIT"
  
  spec.required_ruby_version     = '>= 2.0.0'
  
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "simplecov"
  
  spec.add_dependency "httparty"
end
