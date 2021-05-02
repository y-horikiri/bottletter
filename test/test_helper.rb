ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def is_logged_in?
    !session[:user_id].nil?
  end
  
  def log_in_as(user)
    session[:user_id] = user.id
  end
    
  class ActionDispatch::IntegrationTest
    def easy_log_in
      post users_path params: { user: { name: "test_user" } }
      assigns(:user)
    end
  end
end
