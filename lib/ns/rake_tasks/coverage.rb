if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-rcov'
  require 'simplecov-rcov-text'
  require 'codeclimate-test-reporter'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::RcovFormatter,
    SimpleCov::Formatter::RcovTextFormatter,
    CodeClimate::TestReporter::Formatter,
  ]
  if defined?(Rails)
    SimpleCov.start 'rails'
  else
    SimpleCov.start
  end
end
