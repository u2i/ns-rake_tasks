# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'u2i/ci_utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'u2i-ci_utils'
  spec.version       = U2i::CiUtils::VERSION
  spec.authors       = ['Adam Zima']
  spec.email         = ['adam.zima@u2i.com']
  spec.summary       = %q{Gem with rake tasks used across ns projects.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  # TODO - check if we need production dependency
  spec.add_dependency 'rake'

  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'rubocop-checkstyle_formatter'

  spec.add_dependency 'simplecov', '~> 0.14.1'
  spec.add_dependency 'simplecov-rcov'
  spec.add_dependency 'simplecov-rcov-text'
  spec.add_dependency 'codeclimate-test-reporter'

  spec.add_dependency 'ci_reporter'
  spec.add_dependency 'ci_reporter_rspec'

  if RUBY_PLATFORM == 'java'
    spec.platform = 'java'
  else
    spec.add_dependency 'pronto', '~> 0.7'
    spec.add_dependency 'pronto-rubocop', '~> 0.7'
    spec.add_dependency 'pronto-brakeman', '~> 0.7'
    spec.add_dependency 'pronto-flay', '~> 0.7'
    spec.add_dependency 'pronto-reek', '~> 0.7'
    spec.add_dependency 'pronto-fasterer', '~> 0.7'
  end
end
