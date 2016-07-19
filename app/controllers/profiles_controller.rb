class ProfilesController < ApplicationController
  before_filter :find_profile

  def show
  end

  def search_gender(term)
    Profile.where(gender: term)
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
    @profile_results = search_gender(params[:gender])
  end

  private

  def find_profile
    if params[:id]
      @profile = Profile.find(params[:id])
    end
  end

  def get_profile_update_params
    params.require(:profile).permit(:drinker, :biography)  
  end

end
