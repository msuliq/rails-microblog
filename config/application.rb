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
  end
end
