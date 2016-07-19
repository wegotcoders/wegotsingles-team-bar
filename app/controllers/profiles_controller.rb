class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
  
  def search
    
  end
  
  def search_results
    @profile_results = search_profiles(params[:search])
  end

  def search_profiles(params)
    all = Profile.unscoped
    
    if params["ethnicity"]
      all = all.where(ethnicity: params["ethnicity"])
    end

    if params["gender"]
      all = all.where(gender: params["gender"])
    end

    all
  end

end