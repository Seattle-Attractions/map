ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest/rails/capybara'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
    # order.
    self.fixture_path = File.join(Rails.root, 'spec', 'fixtures')
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def log_in(admin)
      visit new_admin_session_path
      fill_in 'Email', with: admins(admin).email
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    def log_in_incorrectly
      visit new_admin_session_path
      fill_in 'Email', with: 'notreal@email.com'
      fill_in 'Password', with: 'IzHacker'
      click_on 'Log in'
    end
  end
end
