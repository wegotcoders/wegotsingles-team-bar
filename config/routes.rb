Rails.application.routes.draw do
  root 'pages#home'
  
  get 'profiles/search', to: 'profiles#search'
  get 'profiles/search_results', to: 'profiles#search_results'
end
