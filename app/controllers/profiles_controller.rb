class ProfilesController < ApplicationController
  before_filter :find_profile

  def show
  end

  def delete_image
    images=@profile.avatars
    if params[:index_tag].to_i == 0
      @profile.avatars=[]
    else
      images.delete_at(params[:index_tag].to_i)
      @profile.avatars=images
    end
    @profile.save!
    redirect_to @profile
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

    unless params[:ethnicity].blank?
      all = all.where(ethnicity: params[:ethnicity])
    end

    unless params[:gender].blank?
      all = all.where(gender: params[:gender])
    end

    unless params[:min_age].blank?
      all = all.where("date_of_birth < ?", get_date_paramater(params[:min_age]))
    end

    unless params[:max_age].blank?
      all = all.where("date_of_birth > ?", get_date_paramater(params[:max_age]))
    end

    unless params[:town_city].blank? || params[:country].blank? || params[:distance].blank?
      location = "#{params[:town_city]}, #{params[:country]}"
      in_range_profiles = Profile.near(location, params[:distance], units: :km)
      all = all.merge(in_range_profiles)
    end

    unless params[:proximity].blank? || params[:user_location].blank?
      all = all.near(params[:user_location], params[:proximity], units: :km)
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
    add_images(params[:profile][:avatars]) if params[:profile][:avatars]
    params.require(:profile).permit(:drinker, :biography, :desires, :smoker, :star_sign, :weight, :avatars)
  end

  def add_images(new_image)
    image=@profile.avatars
    image+=new_image
    @profile.avatars=image
    @profile.save!
  end

end
