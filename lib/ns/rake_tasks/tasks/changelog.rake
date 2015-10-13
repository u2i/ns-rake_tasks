require 'github_changelog_generator/task'

namespace :ns do
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  end

end
