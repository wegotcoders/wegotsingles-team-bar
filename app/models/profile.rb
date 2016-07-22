class Profile < ActiveRecord::Base
  belongs_to :customer, foreign_key: :customer_id

  enum gender: [:male, :female, :transgender]

  STAR_SIGNS = [['Aries','aries'],['Taurus','taurus'],['Gemini','gemini'],
    ['Cancer','cancer'],['Leo','leo'],['Virgo','virgo'],['Pisces','pisces'],
    ['Libra','libra'],['Scorpio','scorpio'],['Sagittarius','sagittarius'],
    ['Capricorn','capricorn'],['Aquarius','aquarius']]

  enum ethnicity: [:caucasian, :black, :hispanic, :indian, :middle_eastern]

  geocoded_by :geocoder_input
  after_validation :geocode
  
  def age
    dob = self.date_of_birth
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def geocoder_input
    [self.town_city, self.country].join(', ')
  end
end
