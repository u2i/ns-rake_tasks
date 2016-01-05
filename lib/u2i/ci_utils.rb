require 'u2i/ci_utils/version'

module U2i
  module CiUtils
    require 'u2i/ci_utils/railtie' if defined?(Rails)
  end
end
