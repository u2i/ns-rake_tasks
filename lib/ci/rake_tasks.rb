require 'ci/rake_tasks/version'

module Ci
  module RakeTasks
    require 'ci/rake_tasks/railtie' if defined?(Rails)
  end
end
