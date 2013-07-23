require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module ContactManager
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework      :rspec, fixture: true
      g.fixture_replacement :fabrication
    end

  end

  config.action_view.javascript_expansions[:defaults] = %w(jquery.min jquery_ujs)

end
