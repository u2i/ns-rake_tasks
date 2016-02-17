require 'ci/reporter/rake/rspec'

namespace :ci do
  desc 'run RSpec with CI formatters (JUnit XML)'
  task spec: %w(ci:setup:rspec ^spec)
  task hive_spec: %w(ci:setup:rspec ^hive_spec)

  task :prepare_config do
    Dir.glob('config/ci/*.ci.yml').each do |config_file|
      matched = config_file.match(/config\/ci\/(.+)\.ci\.yml/)
      destination = File.join('config', "#{matched[1]}.yml")
      FileUtils.copy(config_file, destination) unless File.exist?(destination)
    end
  end
end
