require 'ns/rake_tasks'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :rake_tasks

    rake_tasks do
      load 'ns/rake_tasks/tasks/pronto.rake'
    end
  end
end