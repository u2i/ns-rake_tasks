# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ns/rake_tasks/version'

Gem::Specification.new do |spec|
  spec.name          = 'ns-rake_tasks'
  spec.version       = Ns::RakeTasks::VERSION
  spec.authors       = ['Adam Zima']
  spec.email         = ['adam.zima@u2i.com']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  # TODO - check if we need production dependency
  spec.add_dependency 'rake'
  spec.add_dependency 'pronto'
  spec.add_dependency 'pronto-rubocop'
  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'rubocop-checkstyle_formatter'

  spec.add_dependency 'simplecov'
  spec.add_dependency 'simplecov-rcov'
  spec.add_dependency 'simplecov-rcov-text'
  spec.add_dependency 'codeclimate-test-reporter'
end
