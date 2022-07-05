# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'active_storage_validations',   '~> 0.9'
gem 'bcrypt',                       '~> 3.1'
gem 'bootsnap',                     '~> 1.12', require: false
gem 'cssbundling-rails',            '~> 1.1'
gem 'image_processing',             '~> 1.12'
gem 'jbuilder',                     '~> 2.11'
gem 'jsbundling-rails',             '~> 1.0'
gem 'matrix',                       '~> 0.4'
gem 'net-smtp',                     '~> 0.3'
gem 'pagy',                         '~> 5.10'
gem 'propshaft',                    '~> 0.6'
gem 'puma',                         '~> 5.6'
gem 'rails',                        '~> 7.0'
gem 'redis',                        '~> 4.6'
gem 'turbo-rails',                  '~> 1.1'
gem 'faker',                        '~> 2.21'

group :development, :test do
  gem 'byebug',                     '~> 11.1', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-performance',        '~> 1.14'
  gem 'rubocop-rails',              '~> 2.15'
  gem 'sqlite3',                    '~> 1.4'
end

group :development do
  gem 'listen',                     '~> 3.7'
  gem 'rack-mini-profiler',         '~> 3.0'
  gem 'spring',                     '~> 4.0'
  gem 'web-console',                '~> 4.2'
end

group :test do
  gem 'capybara',                   '~> 3.37'
  gem 'guard',                      '~> 2.18'
  gem 'guard-minitest',             '~> 2.4'
  gem 'minitest',                   '~> 5.16'
  gem 'minitest-reporters',         '~> 1.5'
  gem 'rails-controller-testing',   '~> 1.0'
  gem 'rubocop-minitest',           '~> 0.20'
  gem 'selenium-webdriver',         '~> 4.2'
  gem 'simplecov',                  '~> 0.21', require: false
  gem 'webdrivers',                 '~> 5.0'
end

group :production do
  gem 'aws-sdk-s3',                 '~> 1.114', require: false
  gem 'pg',                         '~> 1.4'
  gem 'ruby-vips',                  '~> 2.1'
end
