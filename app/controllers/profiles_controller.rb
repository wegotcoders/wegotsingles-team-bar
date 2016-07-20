class ProfilesController < ApplicationController
  before_filter :find_profile

  def show
  end
  
  def search
    
  end

  def edit
  end

  def update
    if @profile.update(get_profile_update_params)
      flash[:notice] = "Your profile has been successfuly updated!"
    else
      flash[:error] = "Oops something went wrong :("
    end
    
    redirect_to @profile
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
  
  private

  def find_profile
    if params[:id]
      @profile = Profile.find(params[:id])
    end
  end

  def get_profile_update_params
    params.require(:profile).permit(:drinker)  
  end

end
