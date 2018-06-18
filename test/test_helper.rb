ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'database_cleaner'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods

  DatabaseCleaner.strategy = :transaction
  setup { DatabaseCleaner.start }
  teardown  { DatabaseCleaner.clean }
end
