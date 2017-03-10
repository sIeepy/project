Rails.application.routes.draw do

  root 'index#home'
  get 'index/home'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/create', to: 'databases#new'
  get '/edit', to: 'databases#edit'
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
