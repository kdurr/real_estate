require 'spec_helper'

feature 'add a building record', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do
  #
  # Acceptance Criteria:
  #
  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format,
  #   the building is recorded
  # If I do not specify all of the required information in the required formats,
  #     the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record
  #   another building

  scenario 'with valid info, the building is recorded' do
    prev_count = Building.count
    visit new_building_path
    fill_in 'Street Address', with: '1403 Club Drive'
    fill_in 'City', with: 'Vero Beach'
    select 'FL', from: 'State'
    fill_in 'Postal Code', with: "32963"
    fill_in 'Description', with: 'This was my home! Beach time!'
    fill_in 'Owner', with: 2
    click_button 'Add Building'
    expect(page).to have_content("Building successfully added!")
    expect(Building.count).to eql(prev_count + 1)
  end

  scenario 'with invalid info, the building is not recorded' do
    prev_count = Building.count
    visit new_building_path
    click_button 'Add Building'
    expect(page).to have_content("can't be blank")
    expect(Building.count).to eql(prev_count)
  end
end