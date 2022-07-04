# frozen_string_literal: true

require File.expand_path('boot', __dir__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsMicroblog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Configuration for loading local_env.yml file to read env variables
    # http://railsapps.github.io/rails-environment-variables.html
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      if File.exist?(env_file)
        YAML.load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # config.active_record.raise_in_transactional_callbacks = true

    # Enable authentification token for remote forms
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # Leaving `ActiveRecord::ConnectionAdapters::SQLite3Adapter.represent_boolean_as_integer`
    # set to false is deprecated. SQLite databases have used 't' and 'f' to serialize
    # boolean values and must have old data converted to 1 and 0 (its native boolean
    # serialization) before setting this flag to true. Conversion can be accomplished
    # by setting up a rake task which runs

    #   ExampleModel.where("boolean_column = 't'").update_all(boolean_column: 1)
    #   ExampleModel.where("boolean_column = 'f'").update_all(boolean_column: 0)

    # for all models and all boolean columns, after which the flag must be set to
    # true by adding the following to your application.rb file:

    #   Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
    # (called from <top (required)> at /Users/Suleyman/Projects/rails_microblog/config/environment.rb:8)
    # config.active_record.sqlite3.represent_boolean_as_integer = true

    config.load_defaults 7.0

    # For new apps, image transformation will use libvips instead of ImageMagick.
    # This will reduce the time taken to generate variants as well as CPU and memory
    # usage, improving response times in apps that rely on Active Storage to serve their
    # images.
    config.active_storage.variant_processor = :vips

    # Turbo supersedes the functionality offered by Rails UJS to turn links and form
    # submissions into XMLHttpRequests, so if you're making a complete switch from
    # Rails UJS / Turbolinks to Turbo, you should ensure that you have
    config.action_view.form_with_generates_remote_forms = false
  end
end
