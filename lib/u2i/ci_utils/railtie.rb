require 'u2i/ci_utils'
require 'rails'

module U2i
  module CiUtils
    class Railtie < Rails::Railtie
      railtie_name :u2i_ci_rake_tasks

      rake_tasks do
        require 'u2i/ci_utils/rake_tasks/all'
      end
    end
  end
end
