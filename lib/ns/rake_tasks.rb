require "ns/rake_tasks/version"

module Ns
  module RakeTasks
    require 'ns/rake_tasks/railtie' if defined?(Rails)
  end
end
