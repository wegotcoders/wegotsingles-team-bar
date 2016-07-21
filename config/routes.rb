Rails.application.routes.draw do
  root 'pages#home'
  
  post 'profiles/:id/delete_image', to: 'profiles#delete_image'
  
  resources :profiles, :only => [:show, :edit, :update] do
    collection do
      get :search
      get :search_results
    end
  end
end
