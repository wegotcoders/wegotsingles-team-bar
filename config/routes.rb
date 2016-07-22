Rails.application.routes.draw do
  devise_for :customers, controllers: { registrations: 'registrations' }

  root 'pages#home'

  resources :messages, :only => [:index, :create]

  resources :profiles, :only => [:show, :edit, :update] do
    collection do
      get :search
      get :search_results
    end
  end
end
