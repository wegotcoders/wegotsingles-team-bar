class Profile < ActiveRecord::Base
  belongs_to :customer, foreign_key: :customer_id

  enum gender: [:male, :female, :transgender]

  mount_uploaders :avatars, AvatarUploader

  STAR_SIGNS = [['Aries','aries'],['Taurus','taurus'],['Gemini','gemini'],
    ['Cancer','cancer'],['Leo','leo'],['Virgo','virgo'],['Pisces','pisces'],
    ['Libra','libra'],['Scorpio','scorpio'],['Sagittarius','sagittarius'],
    ['Capricorn','capricorn'],['Aquarius','aquarius']]

  EXCLUDED_ATTRIBUTES =["id", "customer_id", "created_at", "updated_at", "latitude", "longitude"]

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

  def completedness
    total_attributes=self.attribute_names - EXCLUDED_ATTRIBUTES
    filled_attributes=0
    total_attributes.each do |attribute|
      filled_attributes+=1 if self.send("#{attribute}").present?
    end
    ((filled_attributes * 100)/total_attributes.length)
  end
end
