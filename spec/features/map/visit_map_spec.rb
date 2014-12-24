require 'spec_helper'

feature 'visiting the map page' do
  scenario 'a visitor should see all attractions on entering the map page' do
    visit root_path
    page.text.must_include attractions(:museum).name
    page.text.must_include attractions(:mall).name
  end

  scenario 'a visitor should see attractions in alphabetical order' do
    visit root_path
    page.first('div.attraction').text.must_include attractions(:museum).name
  end

  # scenario 'a visitor can filter attractions by location', js: true do
  #   visit root_path

  #   page.select(locations(:northgate).name, from: 'location')
  #   page.text.wont_include attractions(:museum).name
  #   page.text.must_include attractions(:mall).name
  # end

  # scenario 'a visitor can bring up an info window by clicking on an attraction', js: true do
  #   visit root_path
  #   page.text.wont_include attractions(:museum).description
  #   find('div.attraction', text: attractions(:museum).name).click
  #   page.text.must_include attractions(:museum).description
  # end

  # scenario 'attractions are highlighted when clicked on the sidebar', js: true do
  #   visit root_path
  #   attraction = find('div.attraction', text: attractions(:museum).name)
  #   page.wont_have_css('.selected')

  #   attraction.click
  #   attraction.must_have_css('.selected')
  # end

  # scenario 'selected attractions are de-highlighted when another is clicked', js: true do
  #   visit root_path

  #   first_attr = find('div.attraction', text: attractions(:museum).name)
  #   first_attr.click
  #   first_attr.must_have_css('.selected')

  #   second_attr = find('div.attraction', text: attractions(:mall).name)
  #   second_attr.click
  #   first_attr.wont_have_css('.selected')
  #   second_attr.must_have_css('.selected')
  # end
end
