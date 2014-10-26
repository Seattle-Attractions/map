require 'spec_helper'

feature 'authorization' do
  before do
    log_in(:admin)
    visit attractions_path
  end

  scenario 'basic index view should show names of attractions' do
    page.text.must_include attractions(:museum).name
  end

  scenario 'clicking the show button renders attraction details' do
    page.find("#attraction_#{attractions(:museum).id}").click_on('Show')
    page.text.must_include attractions(:museum).address
  end

  scenario 'clicking on the new attractions button gives fields' do
    page.click_on('New Attraction')
    page.must_have_field 'Name'
  end

  scenario 'submitting creates a new attraction' do
    page.click_on 'New Attraction'
    fill_in 'Name', with: 'Super Cool Place'
    click_on 'Create Attraction'
    page.text.must_include 'Super Cool Place'
  end
end
