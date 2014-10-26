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
    visit root_path

    page.text.wont_include 'Admin Resources'

    log_in(:admin)

    page.text.must_include 'Admin Resources'
  end

  scenario 'a visitor can not access the index page for attractions' do
    visit attraction_path(attractions(:museum))

    page.text.must_include 'You need to sign in or sign up before continuing'
  end
end
