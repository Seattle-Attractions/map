require 'spec_helper'

feature 'geocoding' do
  scenario 'map should auto populate latitude and longitude' do
    log_in(:admin)
    visit new_attraction_path
    fill_in 'Address', with: '19 W Thomas St Seattle, WA'
    click_on 'Create Attraction'
    page.text.must_include 'Attraction saved'
    visit attractions_path
    page.find('tr', text: '19 W Thomas').click_on('Show')
    page.text.must_include '47.6209264'
  end
end
