# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'social_oauth_api/version'

Gem::Specification.new do |spec|
  spec.name          = "social_oauth_api"
  spec.version       = SocialOauthApi::VERSION
  spec.authors       = ["Spirit"]
  spec.email         = ["neverlandxy.naix@gmail.com"]
  spec.summary       = %q{social oauth for api}
  spec.description   = %q{social oauth for api}
  spec.homepage      = "https://github.com/NaixSpirit/social_oauth_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
