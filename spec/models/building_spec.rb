require 'spec_helper'

describe Building do
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :postal_code }

  it { should have_valid(:street_address).when('33 Harrison Ave', '10 Redbud Way') }
  it { should_not have_valid(:street_address).when(nil, '') }

  it { should have_valid(:city).when('Boston', 'Vero Beach') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA', 'NC') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:postal_code).when('02122', '32960') }
  it { should_not have_valid(:postal_code).when(nil, '', 'abc', '1234567', '123')}
end
