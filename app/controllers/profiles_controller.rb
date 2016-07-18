class ProfilesController < ApplicationController
<<<<<<< HEAD

  def show
    @profile = Profile.find(params[:id])
  end

end
=======
  def search_gender(term)
    Profile.where(gender: term)
  end
  
  def search
    
  end
  
  def search_results
    @profile_results = search_gender(params[:gender])
  end
end
>>>>>>> 3cbb5a81b0142e7cb3812e09fb969237e3b5c494
