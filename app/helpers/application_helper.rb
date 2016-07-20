module ApplicationHelper
  def get_pre_selected_option(property, initial_value)
    (params[:search] && params[:search]["#{property}"] && params[:search]["#{property}"] != "") ? params[:search]["#{property}"].to_i : nil
  end
  
  def gender_options
    options_for_select([
      ['Choose Gender...', nil],
      ['Male', 0],
      ['Female', 1],
      ['Transgender', 2]
    ], get_pre_selected_option("gender", nil))
  end
  
  def ethnicity_options
    options_for_select([
      ['Choose Ethnicity...', nil],
      ['Caucasian', 0],
      ['Black', 1],
      ['Hispanic', 2],
      ['Indian', 3],
      ['Middle Eastern', 4]
    ], get_pre_selected_option("ethnicity", nil))
  end
  
  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
