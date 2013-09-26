require 'spec_helper'

describe Tenant do
  it { should belong_to :building }
  it { should belong_to :owner }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :building_id }
  it { should validate_presence_of :email }

  it { should have_valid(:first_name).when('George', 'Ringo') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Harrison', 'Star') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:building_id).when(25, 16) }
  it { should_not have_valid(:building_id).when(nil, '', 'abc') }

  it { should have_valid(:email).when('gh@beatles.com', 'rs@beatles.com') }
  it { should_not have_valid(:email).when(nil, '', 'woeir2343') }


  it 'should destroy tenant record when evicted' do
    expect { click_link('Evict') }.to change(Tenant, :count).by(-1)
  end

end

