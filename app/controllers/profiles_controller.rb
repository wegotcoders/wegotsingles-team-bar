class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def search_gender(term)
    Profile.where(gender: term)
  end
  
  def search
    
  end
  
  def search_results
    @profile_results = search_gender(params[:gender])
  end
end