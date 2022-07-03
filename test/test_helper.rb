# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
# enable reporting tool for minitest
require 'minitest/reporters'

Minitest::Reporters.use!

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    # Application helper is added to include full_title method in layout test
    include ApplicationHelper

    # Add more helper methods to be used by all tests here...
    # def setup
    #   @user = User.new(name: "Example User", email: "user@example.com",
    #                   password: "foobar", password_confirmation: "foobar")
    # end

    # This is different from logged_in? defined in sessions helper
    def is_logged_in?
      !session[:user_id].nil?
    end

    # Logs in a test user
    def log_in_as(user)
      session[:user_id] = user.id
    end
  end
end

# Separate login as method for integration tests
module ActionDispatch
  class IntegrationTest
    include TurboAssertionsHelper
    # Log in as a particular user.
    def log_in_as(user, password: 'password', remember_me: '1')
      post login_path, params: { session: { email: user.email,
                                            password: password,
                                            remember_me: remember_me } }
    end
  end
end
