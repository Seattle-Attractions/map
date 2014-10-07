require 'spec_helper'

feature 'signing in as admin' do
  scenario 'admin should see flash message confirming sign-in' do
    log_in(:admin)

    page.text.must_include 'Signed in successfully'
  end

  scenario 'an improper password prevents log in' do
    log_in_incorrectly

    page.text.must_include 'Invalid email address or password'
  end
end
