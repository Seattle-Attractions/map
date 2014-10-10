require 'spec_helper'

feature 'visiting the map page' do
  scenario 'a visitor should see all attractions on entering the map page' do
    visit root_path
    page.text.must_include attractions(:museum).name
    page.text.must_include attractions(:mall).name
  end

  scenario 'a visitor can filter attractions by location', js: true do
    visit root_path

    page.select(locations(:northgate).name, from: 'location')
    page.text.wont_include attractions(:museum).name
    page.text.must_include attractions(:mall).name
  end

  scenario 'a visitor can bring up an info window by clicking on an attraction', js: true do
    visit root_path
    page.text.wont_include attractions(:museum).description
    find('div.attraction', text: attractions(:museum).name).click
    page.text.must_include attractions(:museum).description
  end
end
