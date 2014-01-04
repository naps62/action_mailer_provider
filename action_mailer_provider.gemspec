# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_mailer_provider/version'

Gem::Specification.new do |spec|
  spec.name          = "action_mailer_provider"
  spec.version       = ActionMailerProvider::VERSION
  spec.authors       = ["Miguel Palhas"]
  spec.email         = ["mpalhas@gmail.com"]
  spec.description   = %q{Action Mailer configuration helper}
  spec.summary       = %q{Configure Action Mailer gem according to your email provider specs (Google, Zoho Mail, etc)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "actionmailer"
  spec.add_dependency "rails"
end
