if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-rcov'
  require 'simplecov-rcov-text'
  require 'codeclimate-test-reporter'

  SimpleCov.add_filter '/spec/'
  SimpleCov.formatters = [
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
