require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module BeFastFood
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('app/utils')
    config.eager_load_paths << Rails.root.join('app/utils')

    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.api_only = true
  end
end
