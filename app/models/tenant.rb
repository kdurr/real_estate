class Tenant < ActiveRecord::Base
  belongs_to :building
  belongs_to :owner

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :building_id
  validates_presence_of :email

  validates_numericality_of :building_id

  validates_format_of :email, 
    :with => /.+@.+\..+/i
end
