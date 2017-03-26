require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
module SplitFair
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.test_framework :rspec
    end
  end
end
