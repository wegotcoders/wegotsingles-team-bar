Rails.application.routes.draw do
  root 'pages#home'

  resources :profiles, :only => :show do
    collection do
      get :search
      get :search_results
    end
  end
end
