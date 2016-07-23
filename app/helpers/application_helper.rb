module ApplicationHelper
  def get_pre_selected_option(property)
    (params[:search] && params[:search]["#{property}"] && params[:search]["#{property}"] != "") ? params[:search]["#{property}"].to_i : nil
  end

  def gender_options
    options_for_select([
      ['Choose Gender...', nil],
      ['Male', 0],
      ['Female', 1],
      ['Transgender', 2]
    ], get_pre_selected_option("gender"))
  end

  def ethnicity_options
    options_for_select([
      ['Choose Ethnicity...', nil],
      ['Caucasian', 0],
      ['Black', 1],
      ['Hispanic', 2],
      ['Indian', 3],
      ['Middle Eastern', 4]
    ], get_pre_selected_option("ethnicity"))
  end

  def industry_options
    options_for_select([
      ['Choose industry...', nil],
      ['Accountancy', 0],
      ['Admin', 1],
      ['Banking', 2],
      ['Building', 3],
      ['Call Centre', 4],
      ['Charity', 5],
      ['Education', 6],
      ['Engineering', 7],
      ['Hospitality, Tourism', 8],
      ['Human Resource', 9],
      ['Industrial', 10],
      ['IT', 11],
      ['Legal', 12],
      ['Marketing', 13],
      ['Sales', 14],
      ['Telecommunications', 15]
    ], get_pre_selected_option("Industry"))
  end

  def distance_options
    options_for_select([
      ['Distance (km)...', nil],
      [1, 1],
      [2, 2],
      [5, 5],
      [10, 10],
      [25, 25],
      [50, 50]
    ], get_pre_selected_option("distance"))
  end

  def star_sign_options
    options_for_select([
      ['Select your star sign...', nil],
      ['Aries','0'],
      ['Taurus','1'],
      ['Gemini','2'],
      ['Cancer','3'],
      ['Leo','4'],
      ['Virgo','5'],
      ['Pisces','6'],
      ['Libra','7'],
      ['Scorpio','8'],
      ['Sagittarius','9'],
      ['Capricorn','10'],
      ['Aquarius','11']
    ], get_pre_selected_option("star sign"))
  end

  def religion_options
    options_for_select([
      ['Religion...', nil],
      ['Christianity', 0],
      ['Islam', 1],
      ['Hinduism', 2],
      ['Buddhism',3],
      ['Judaism', 4],
      ['Pastafarianism', 5],
      ['Agnosticism', 6],
      ['Atheism', 7],
      ['Sikhism', 8]
    ], get_pre_selected_option("religion"))
  end
end
