Rails.application.routes.draw do
  devise_for :customers
  root 'pages#home'

  resources :profiles, :only => [:show, :edit, :update] do
    collection do
      get :search
      get :search_results
    end
  end
end
