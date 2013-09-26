class Building < ActiveRecord::Base
  belongs_to :owner,
    inverse_of: :buildings

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code

  validates_numericality_of :postal_code
  validates_length_of :postal_code, :is=>5

  validates_numericality_of :owner_id
  # Need to validate formate of postal_code to take zipcodes starting with 0

  def self.states
    [
      ['AK'],
      ['AL'],
      ['AR'],
      ['AZ'],
      ['CA'],
      ['CO'],
      ['CT'],
      ['DC'],
      ['DE'],
      ['FL'],
      ['GA'],
      ['HI'],
      ['IA'],
      ['ID'],
      ['IL'],
      ['IN'],
      ['KS'],
      ['KY'],
      ['LA'],
      ['MA'],
      ['MD'],
      ['ME'],
      ['MI'],
      ['MN'],
      ['MO'],
      ['MS'],
      ['MT'],
      ['NC'],
      ['ND'],
      ['NE'],
      ['NH'],
      ['NJ'],
      ['NM'],
      ['NV'],
      ['NY'],
      ['OH'],
      ['OK'],
      ['OR'],
      ['PA'],
      ['RI'],
      ['SC'],
      ['SD'],
      ['TN'],
      ['TX'],
      ['UT'],
      ['VA'],
      ['VT'],
      ['WA'],
      ['WI'],
      ['WV'],
      ['WY']
    ]
  end
end
