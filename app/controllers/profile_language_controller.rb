class ProfileLanguageController < ApplicationController

  def create
    ProfileLanguage.create(profile_language_params)
    redirect_to edit_profile
  end

  private

  def profile_language_params
    params.require(:language).permit(:language_id, :profile_id)
  end

end
