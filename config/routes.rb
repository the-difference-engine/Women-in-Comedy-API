Rails.application.routes.draw do
  devise_for :users
  #devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #for getting users info when they login
  get '/api/v1/users/info', to: 'api/v1/users#fetch_user_info'
  #for getting users feed
  get '/api/v1/users/feed', to: 'api/v1/users#fetch_user_feed'

   #search users
  get '/api/v1/users/search', to: 'api/v1/users#search'

  #for getting users connections
  get '/api/v1/users/connections', to: 'api/v1/connection_requests#get_connections'
  #for getting pending user connections
  get '/api/v1/users/pending_connections', to: 'api/v1/connection_requests#get_pending_connections'
  #for getting connection status with user
  post '/api/v1/users/connection/status', to: 'api/v1/connection_requests#status'
  post '/api/v1/users/connections', to: 'api/v1/connection_requests#create'
  # this is the id of the sender
  patch '/api/v1/users/connections/:id', to: 'api/v1/connection_requests#update'
  # this the id of the connection we are trying to update
  delete '/api/v1/users/connections/:id', to: 'api/v1/connection_requests#destroy'

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  namespace :api do
    namespace :v1 do
      resources :sessions
    end
  end



end
