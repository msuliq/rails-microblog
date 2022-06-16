# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'carrierwave',                  '~> 2.2.2'
gem 'fog',                          '~> 2.2.0'
gem 'mini_magick',                  '~> 4.11.0'
gem 'rails',                        '~> 7.0.3'

gem 'active_storage_validations',   '~> 0.9.8'
gem 'bcrypt',                       '~> 3.1.18'
gem 'bootsnap',                     '~> 1.7.2', require: false
gem 'bootstrap-sass',               '~> 3.4.1'
gem 'bootstrap-will_paginate',      '~> 1.0.0'
gem 'faker',                        '~> 2.21.0'
gem 'image_processing',             '~> 1.12.2'
gem 'jbuilder',                     '~> 2.11.5'
gem 'matrix',                       '~> 0.4.2'
gem 'net-smtp',                     '~> 0.3.1'
gem 'puma',                         '~> 5.6.4'
gem 'sass-rails',                   '~> 6.0.0'
gem 'turbolinks',                   '~> 5.2.1'
gem 'webpacker',                    '~> 5.4.0'
gem 'will_paginate',                '~> 3.3.1'

group :development, :test do
  gem 'byebug',                   '~> 11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-performance',      '~> 1.14.0'
  gem 'rubocop-rails',            '~> 2.14.2'
  gem 'sqlite3',                  '~> 1.4.2'
end

group :development do
  gem 'listen',                   '~> 3.4.1'
  gem 'rack-mini-profiler',       '2.3.1'
  gem 'spring',                   '~> 4.0.0'
  gem 'web-console',              '~> 4.2.0'
end

group :test do
  gem 'capybara',                 '3.35.3'
  gem 'guard', '2.16.2'
  gem 'guard-minitest',           '2.4.6'
  gem 'minitest',                 '~> 5.15.0'
  gem 'minitest-reporters',       '1.3.8'
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'rubocop-minitest',         '~> 0.19.1'
  gem 'selenium-webdriver',       '3.142.7'
  gem 'simplecov',                '~> 0.21.2', require: false
  gem 'webdrivers',               '4.6.0'
end

group :production do
  gem 'aws-sdk-s3',               '~> 1.114.0', require: false
  gem 'pg',                       '~> 1.3.5'
  gem 'rails_12factor',           '0.0.2'
end
