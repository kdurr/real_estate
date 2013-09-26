require 'spec_helper'

feature 'add new tenant', %Q{
  As an owner
  I want to add a tenant
  So that I can keep track of who is renting in my building
  } do
 #
 # Acceptance Criteria:
 # I must specify a first name, last name, building they're renting in,
 #  and a valid email address
 # If the tenant info is valid, the tenant is associated with the building.
 #  The info is persisted.
 # If the tenant info is invalid, an error message is supplied so the landlord
 #  can fix the entry. The info is not persisted.
 #
 # There is a page that lists all of my tenants sorted by last and first name
 # I can see where each tenant lives and what their email address is

 scenario 'with valid info, owner can add tenant' do
  prev_count = Tenant.count
  visit new_tenant_path
  fill_in 'First name', with: 'John'
  fill_in 'Last name', with: 'Lennon'
  fill_in 'Building ID', with: 5
  fill_in 'Email', with: 'jl@beatles.com'
  click_button 'Add Tenant'
  expect(page).to have_content("Tenant successfully added")
  expect(Tenant.count).to eql(prev_count + 1)
 end

 scenario 'with invalid info, owner cannot add tenant' do
  prev_count = Tenant.count
  visit new_tenant_path
  click_button 'Add Tenant'
  expect(page).to have_content("can't be blank")
  expect(Tenant.count).to eql(prev_count)
 end

 scenario 'list all tenants' do
  visit tenants_path
  expect(page).to have_content("First Name")
 end

end