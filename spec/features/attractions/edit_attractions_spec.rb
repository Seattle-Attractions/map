require 'spec_helper'

feature 'editing an attraction' do
  scenario 'a visitor can not access the edit page' do
    visit edit_attraction_path(attractions(:museum))

    page.text.must_include 'You need to sign in or sign up before continuing'
  end
end
