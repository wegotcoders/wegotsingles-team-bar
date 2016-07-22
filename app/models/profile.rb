class Profile < ActiveRecord::Base
  belongs_to :customer, foreign_key: :customer_id

  enum gender: [:male, :female, :transgender]
  enum ethnicity: [:caucasian, :black, :hispanic, :indian, :middle_eastern]
  enum industry: [:accountancy, :admin, :banking, :building, :charity, :education, :engineering, :hospitality, :tourism, :human_resource, :industrial, :it, :legal, :marketing, :sales, :telecommunications]
  
  mount_uploaders :avatars, AvatarUploader

  STAR_SIGNS = [['Aries','aries'],['Taurus','taurus'],['Gemini','gemini'],
    ['Cancer','cancer'],['Leo','leo'],['Virgo','virgo'],['Pisces','pisces'],
    ['Libra','libra'],['Scorpio','scorpio'],['Sagittarius','sagittarius'],
    ['Capricorn','capricorn'],['Aquarius','aquarius']]

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
