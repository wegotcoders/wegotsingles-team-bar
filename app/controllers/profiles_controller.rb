class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
  
  def search
    
  end
  
  def search_results
    @profile_results = search_profiles(params[:search])
  end
  
  private
  
  def search_profiles(params)
    all = Profile.unscoped
    
    if params["ethnicity"] && params["ethnicity"] != ""
      all = all.where(ethnicity: params["ethnicity"])
    end
    
    if params["gender"] && params["gender"] != ""
      all = all.where(gender: params["gender"])
    end
    
    if params["min_age"] && params["min_age"] != ""
      all = all.where("date_of_birth < ?", get_date_paramater(params["min_age"]))
    end
    
    if params["max_age"] && params["max_age"] != ""
      all = all.where("date_of_birth > ?", get_date_paramater(params["max_age"]))
    end
    
    all
  end
  
  def get_date_paramater(min_max_age)
    current_day = Time.now.strftime("%d").to_i
    current_month = Time.now.strftime("%D").to_i
    min_max_age_year = Time.now.strftime("%Y").to_i - min_max_age.to_i
    Time.new(min_max_age_year, current_month, current_day)
  end
  
end