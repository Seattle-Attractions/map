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

  scenario 'admin links are only visible to signed-in admins' do
    visit map_path

    page.text.wont_include 'Admin Resources'

    log_in(:admin)

    page.text.must_include 'Admin Resources'
  end
end
