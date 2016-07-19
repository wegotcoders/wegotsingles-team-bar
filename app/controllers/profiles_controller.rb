class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  # def search_gender(term)
  #   Profile.where(gender: term)
  # end
  
  def search
    
  end
  
  def search_results
    @profile_results = search_profiles(params[:search])
  end

  # def show(options = {ethnicity: 0,username: "supreeth"})

  #   all= Profile.unscoped

  #   options.each |option,value|
  #   all=all.where("#{option}","#{value}")
  #   end

  # end

  def search_profiles(params)
    all = Profile.unscoped

    binding.pry
    
    if params["ethnicitiy"]
      all = all.where(ethnicity: params["ethnicity"])
    end

    if params["gender"]
      all = all.where(gender: params["gender"])
    end

    all
  end

end