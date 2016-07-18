class ProfilesController < ApplicationController
  def search_gender(term)
    Profile.where(gender: term)
  end
  
  def search
    
  end
  
  def search_results
    @profile_results = search_gender(params[:gender])
  end
end