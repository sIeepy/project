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
  delete '/disconnect_database', to: 'session_database#destroy'
  get 'new_table', to: 'tables#new'
  post 'new_table', to: 'tables#new'
  get 'show_table', to: 'tables#show'
  post 'show_table', to: 'tables#show'
  get 'edit_table/show', to: 'edit_tables#show'
  post 'edit_table/show', to: 'edit_tables#show'
  get 'edit_table/edit', to: 'edit_tables#edit'
  get 'edit_table/delete', to: 'edit_tables#delete'
  post 'update_table', to: 'edit_tables#update', as: 'update'
  
  resources :tables
  resources :users
  resources :databases
end
