require 'github_changelog_generator/task'

namespace :ci do
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  end
end
