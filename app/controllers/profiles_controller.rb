class ProfilesController < ApplicationController

  def show
    find_profile
  end

  def search_gender(term)
    Profile.where(gender: term)
  end
  
  def search
    
  end

  def edit
    find_profile
  end

  def update
    @profile = find_profile

    if @profile.update(get_profile_update_params)
      flash[:notice] = "Your profile has been successfuly updated!"
    else
      flash[:error] = "Oops something went wrong :("
    end
    
    redirect_to @profile
  end

  def search_results
    @profile_results = search_gender(params[:gender])
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def get_profile_update_params
    params.require(:profile).permit(:drinker)  
  end

end