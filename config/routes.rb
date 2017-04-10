Rails.application.routes.draw do

  root 'index#home'
  get 'index/home'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/create', to: 'databases#new'
  post '/create', to: 'databases#create'
  get '/edit', to: 'databases#edit'
  get '/show_database', to: 'session_database#show'
  get '/connect_database', to: 'session_database#new'
  post '/connect_database', to: 'session_database#create'
  delete '/disconnect_database',  to: 'session_database#destroy'
  post '/new_table', to: 'create_tables#new'
  resources :users
  resources :databases

end
