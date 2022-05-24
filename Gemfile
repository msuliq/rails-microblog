source "https://rubygems.org"

ruby '2.6.3'

gem "rails", "~> 5.2.8"
gem "bcrypt", "3.1.7"
gem "faker", "1.4.2"
gem "carrierwave", "~> 2.0"
gem "mini_magick", "~> 4.11"
gem "fog", "1.36.0"
gem "will_paginate", "~> 3.3.1"
gem "bootstrap-will_paginate", "~> 1.0.0"
gem "bootstrap-sass", "3.2.0.4"
gem "sass-rails", "~> 6.0.0"
# sprockets and sprockets-rails are clearly defined as v3 
# since these support passing of regex to asset precompile
# and fix issue with missing method 'start with?'
gem "sprockets-rails", "~> 3"
gem "sprockets", "~> 3"

gem "uglifier", "2.5.3"
gem "coffee-rails", "~> 5.0.0"
gem "jquery-rails", "4.3.5"
gem "turbolinks", "~> 5.2.1"
gem "jbuilder", "2.9.1"
gem "bundler", "2.3.7"
gem "listen", "2.10.1"
gem "rake", "13.0.6"
gem "sdoc", "0.4.0", group: :doc

group :development do
gem "web-console", "~> 3.7.0"
end

group :development, :test do
gem "sqlite3", "~> 1.4.2"
gem "byebug", "11.0.1"
gem "spring", "1.1.3"
end

group :test do
gem "minitest-reporters", "1.0.5"
gem "rails-controller-testing", "~> 1.0.5"
gem "guard-minitest", "2.3.1"
gem 'simplecov', require: false
end

group :production do
gem "pg", "~> 1.3.5"
gem "rails_12factor", "0.0.2"
gem "puma", "4.3.0"
end
