class Owner < ActiveRecord::Base
  has_many :buildings,
    inverse_of: :owner,
    dependent: :nullify #If delete owner then delete any relationship with building

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of :email, 
    :with => /.+@.+\..+/i
end
