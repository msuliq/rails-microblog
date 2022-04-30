ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#enable reporting tool for minitest
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  #Application helper is added to include full_title method in layout test
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
                    password: "foobar", password_confirmation: "foobar")
  end

end
