class Profile < ActiveRecord::Base
  enum gender: [:male, :female, :transgender]

  STAR_SIGNS = [['Aries','aries'],['Taurus','taurus'],['Gemini','gemini'],
    ['Cancer','cancer'],['Leo','leo'],['Virgo','virgo'],['Pisces','pisces'],
    ['Libra','libra'],['Scorpio','scorpio'],['Sagittarius','sagittarius'],
    ['Capricorn','capricorn'],['Aquarius','aquarius']]

  enum ethnicity: [:caucasian, :black, :hispanic, :indian, :middle_eastern]
  
  def age
    dob = self.date_of_birth
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
