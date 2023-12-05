require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Mec
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Load the secret key base from credentials
    config.secret_key_base = Rails.application.credentials.secret_key_base

    # Configure the default encoding used in templates for Ruby 3.0
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Other configurations...

    config.autoload_lib(ignore: %w(assets tasks))

    # Store uploaded files on the local file system (see config/storage.yml for options)
    config.active_storage.service = :local

    # Time zone
    config.time_zone = "UTC"
    config.active_record.default_timezone = :utc

    # Use the queuing backend for Active Job (default is :async)
    config.active_job.queue_adapter = :sidekiq

    # Middleware configurations...
  end
end
s
