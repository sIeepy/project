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
  delete '/disconnect', to: 'session_database#destroy'
  get 'new_table', to: 'tables#new'
  post 'new_table', to: 'tables#new'
  get 'show_table', to: 'tables#show'
  post 'show_table', to: 'tables#show'
  get 'edit_table/show', to: 'edit_tables#show'
  post 'edit_table/show', to: 'edit_tables#show'
  get 'edit_table/edit', to: 'edit_tables#edit'
  get 'edit_table/delete', to: 'edit_tables#delete'
  post 'update_table', to: 'edit_tables#update', as: 'update'
  get 'add_contents/new', to: 'add_contents#new', as: 'new_content'
  post 'add_contents/add', to: 'add_contents#add', as: 'add_content'
  get 'add_contents/show', to: 'add_contents#show', as: 'show_content'
  post 'columns/create', to: 'columns#create', as: 'add_column'
  get 'columns/delete'

  resources :columns
  resources :tables
  resources :users
  resources :databases
end
