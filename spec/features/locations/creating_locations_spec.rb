require 'spec_helper'

feature 'creating a location' do
  scenario 'locations with the same name are not permitted' do
    log_in(:admin)
    visit new_location_path

    loc = locations(:northgate)
    fill_in 'Name', with: loc.name
    fill_in 'Latitude', with: loc.latitude
    fill_in 'Longitude', with: loc.longitude
    click_on 'Create Location'

    page.text.must_include('prohibited this location from being saved')
  end
end
