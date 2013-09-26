require 'spec_helper'

feature 'add owner profile', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
  } do
  #
  # Acceptance Criteria:
  #
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am
  #   redirected to enter another new owner

  # When recording a building, I want to optionally associate the building
  #   with its rightful owner
  # If I delete an owner, the owner and its primary key should no longer be
  #   associated with any properties

  scenario 'with valid info, a new owner is added' do
    prev_count = Owner.count
    visit new_owner_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'jdoe@example.com'
    fill_in 'Company', with: 'Jane Doe & Family'
    click_button 'Add Owner'
    expect(page).to have_content("Owner Successfully Added")
    expect(Owner.count).to eql(prev_count + 1)
  end

  scenario 'with invalid info, a new owner is not added'
end