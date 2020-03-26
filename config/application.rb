require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Needhave
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Customize generated
    config.generators do |g|
      g.orm             :active_record
      g.test_framework  nil
      g.template_engine nil
      g.stylesheets     false
      g.helper          false
      g.assets          false
    end
  end
end
