Rails.application.routes.draw do
  root 'pages#home'
  
  get 'profiles/search', to: 'profile#search'
end
