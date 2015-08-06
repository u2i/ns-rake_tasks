require 'ns/rake_tasks'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :rake_tasks

    rake_tasks do
      load 'tasks/all'
    end
  end
end
