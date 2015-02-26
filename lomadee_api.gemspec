# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lomadee_api/version'

Gem::Specification.new do |spec|
  spec.name          = "lomadee_api"
  spec.version       = LomadeeApi::VERSION
  spec.authors       = ["Guilherme Kenedy Ferreira"]
  spec.email         = ["guilhermekfe@outlook.com"]
  spec.summary       = %q{ Ruby client for the official Lomadee API }
  spec.description   = %q{ Ruby client for the official Lomadee API }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "json"
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
