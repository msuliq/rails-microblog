source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails',                        '~> 6.1.6'
gem 'carrierwave',                  '~> 2.2.2'
gem 'mini_magick',                  '~> 4.11.0'
gem 'fog',                          '~> 2.2.0'

gem 'active_storage_validations',   '~> 0.9.8'
gem 'bcrypt',                       '~> 3.1.18'
gem 'faker',                        '~> 2.21.0'
gem 'image_processing',             '~> 1.12.2'
gem 'will_paginate',                '~> 3.3.1'
gem 'bootstrap-will_paginate',      '~> 1.0.0'
gem 'bootstrap-sass',               '~> 3.4.1'
gem 'sass-rails',                   '~> 6.0.0'
gem 'puma',                         '~> 5.3.1'
gem 'webpacker',                    '~> 5.4.0'
gem 'turbolinks',                   '~> 5.2.1'
gem 'jbuilder',                     '~> 2.11.5'
gem 'bootsnap',                     '~> 1.7.2',     require: false
gem 'matrix',                       '~> 0.4.2'
gem 'net-smtp',                     '~> 0.3.1'

group :development, :test do
    gem 'sqlite3',                  '~> 1.4.2'
    gem 'byebug',                   '~> 11.0.1',    platforms: [:mri, :mingw, :x64_mingw]
    gem 'rubocop-rails',            '~> 2.14.2'
    gem 'rubocop-performance',      '~> 1.14.0'
end

group :development do
    gem 'web-console',              '~> 4.2.0'
    gem 'rack-mini-profiler',       '2.3.1'
    gem 'listen',                   '~> 3.4.1'
    gem 'spring',                   '~> 2.1.1'
end

group :test do
    gem 'capybara',                 '3.35.3'
    gem 'selenium-webdriver',       '3.142.7'
    gem 'webdrivers',               '4.6.0'
    gem 'rails-controller-testing', '~> 1.0.5'
    gem 'minitest',                 '~> 5.15.0'
    gem 'minitest-reporters',       '1.3.8'
    gem 'guard',                    '2.16.2'
    gem 'guard-minitest',           '2.4.6'
    gem 'rubocop-minitest',         '~> 0.19.1'
    gem 'simplecov',                '~> 0.21.2',    require: false
end

group :production do
    gem 'pg',                       '~> 1.3.5'
    gem 'rails_12factor',           '0.0.2'
    gem 'aws-sdk-s3',               '~> 1.114.0',   require: false
end
