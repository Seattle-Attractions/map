require 'spec_helper'

feature 'editing an attraction' do
  scenario 'a visitor can not access the edit page' do
    visit edit_attraction_path(attractions(:museum))

    page.text.must_include 'You must sign up or sign in before continuing'
  end
end
