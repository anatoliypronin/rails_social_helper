ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
<<<<<<< HEAD
  # fixtures :all
=======
  #fixtures :all
>>>>>>> b229fe344f323db3c90304bc8c294698c1fc3fd7

  # Add more helper methods to be used by all tests here...
end
