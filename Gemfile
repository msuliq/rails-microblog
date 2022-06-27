# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails',                        '~> 7.0.3'
gem 'image_processing',             '~> 1.12.2'
gem 'active_storage_validations',   '~> 0.9.8'
gem 'bcrypt',                       '~> 3.1.18'
gem 'bootsnap',                     '~> 1.12.0', require: false
# gem 'sass-rails',                   '~> 6.0'
# gem 'bootstrap-sass',               '~> 3.4.1'
# gem 'sass-rails',                   '~> 6.0.0'
gem 'will_paginate',                '~> 3.3'
gem 'bootstrap-will_paginate',      '~> 1'
gem 'jbuilder',                     '~> 2.11.5'
gem 'faker',                        '~> 2.21.0'
gem 'matrix',                       '~> 0.4.2'
gem 'net-smtp',                     '~> 0.3.1'
gem 'puma',                         '~> 5.6.4'
# gem 'turbolinks',                   '~> 5.2.1'
gem 'propshaft',                    '~> 0.6'
gem 'jsbundling-rails',             '~> 1.0'
gem 'cssbundling-rails',            '~> 1.1'
gem 'turbo-rails',                  '~> 1.1'

group :development, :test do
  gem 'byebug',                     '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-performance',        '~> 1.14.0'
  gem 'rubocop-rails',              '~> 2.15.0'
  gem 'sqlite3',                    '~> 1.4.2'
end

group :development do
  gem 'listen',                     '~> 3.7.1'
  gem 'rack-mini-profiler',         '~> 3.0.0'
  gem 'spring',                     '~> 4.0.0'
  gem 'web-console',                '~> 4.2.0'
end

group :test do
  gem 'capybara',                   '~> 3.37.1'
  gem 'guard',                      '~> 2.18.0'
  gem 'guard-minitest',             '~> 2.4.6'
  gem 'minitest',                   '~> 5.16.1'
  gem 'minitest-reporters',         '~> 1.5.0'
  gem 'rails-controller-testing',   '~> 1.0.5'
  gem 'rubocop-minitest',           '~> 0.20.1'
  gem 'selenium-webdriver',         '~> 4.2.1'
  gem 'simplecov',                  '~> 0.21.2', require: false
  gem 'webdrivers',                 '~> 5.0.0'
end

group :production do
  gem 'aws-sdk-s3',                 '~> 1.114.0', require: false
  gem 'pg',                         '~> 1.4.0'
  # gem 'ruby-vips',                  '~> 2.1.4'
end

# Use Redis for Action Cable
gem "redis", "~> 4.6"
