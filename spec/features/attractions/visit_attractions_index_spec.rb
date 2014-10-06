require 'spec_helper'

feature 'A visitor should see attractions with expected functionality' do
  scenario 'visit attractions index' do
    visit attractions_path
    page.text.must_include attractions(:museum).name
  end
end
