Rails.application.routes.draw do
  root 'pages#home'
  resources :profiles, :only => :show
end
