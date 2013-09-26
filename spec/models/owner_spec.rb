require 'spec_helper'

describe Owner do
  it { should have_many :buildings }
  
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }

  it { should have_valid(:first_name).when('George', 'Ringo') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Harrison', 'Starr') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:email).when('gh@beatles.com', 'rs@beatles.com') }
  it { should_not have_valid(:first_name).when(nil, '', 'woeir2343') }
end

