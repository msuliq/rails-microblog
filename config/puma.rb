#config file for puma
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count
preload_app!
rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
on_worker_boot do
    # specific settings for Rails 4.1+ are at: https://devcenter.heroku.com/articles/
    # deploying-rails-applications-with-the-puma-web-server#on-worker-boot
    ApplicationRecord.establish_connection
    end
    