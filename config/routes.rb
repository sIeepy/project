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
  post '/new_table', to: 'session_database#table'
  get '/edit_database', to: 'session_database#new'
  post '/edit_database', to: 'session_database#create'
  delete '/user_database',  to: 'session_database#destroy'
  resources :users
  resources :databases

end
