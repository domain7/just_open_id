module JustOpenId
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'extensions/action_controller/base'

  #  This engine is intended to run as a gem.
  #  The lib below will be installed via gem dependencies.
  #  TODO: Get rid of this
  begin
    require "omniauth"
  rescue LoadError => e
    warn "Could not load 'omniauth'. Please ensure you have the omniauth gem installed and listed in your Gemfile."
    raise
  end
end

