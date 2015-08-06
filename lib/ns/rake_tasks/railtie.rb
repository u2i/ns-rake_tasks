require 'ns/rake_tasks'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :rake_tasks

    rake_tasks do
      require 'ns/rake_tasks/tasks/all'
    end
  end
end
