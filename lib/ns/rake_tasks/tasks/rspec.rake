require 'ci/reporter/rake/rspec'

namespace :ci do
  desc 'run RSpec with CI formatters (JUnit XML)'
  task :spec => %w(ci:setup:rspec ^spec)
end
