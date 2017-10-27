Rails.application.routes.draw do
  devise_for :users
  #devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #USERS DATA ROUTES

  #for getting users info when they login
  get '/api/v1/users/info', to: 'api/v1/users#fetch_user_info'
  #for getting users feed
  get '/api/v1/users/feed', to: 'api/v1/users#fetch_user_feed'


  # config/routes.rb
  mount ActionCable.server => '/cable'
  resources :notifications



  #CONNECTIONS REQUEST ROUTES

   #search users
  get '/api/v1/users/search', to: 'api/v1/users#search'


  #for getting users connections
  get '/api/v1/users/connections', to: 'api/v1/connection_requests#get_connections'
  #for getting pending user connections
  get '/api/v1/users/pending_connections', to: 'api/v1/connection_requests#get_pending_connections'
  #for accepting user connections
  post '/api/v1/users/accept_connections', to: 'api/v1/connection_requests#accept'
  #for getting connection status with user
  post '/api/v1/users/connection/status', to: 'api/v1/connection_requests#status'
  post '/api/v1/users/connections', to: 'api/v1/connection_requests#create'
  # this is the id of the sender
  patch '/api/v1/users/connections/:id', to: 'api/v1/connection_requests#update'
  # this the id of the connection we are trying to update
  delete '/api/v1/users/connections/:id', to: 'api/v1/connection_requests#destroy'
  #block incoming connection requests
  post '/api/v1/users/:id', to: 'api/v1/users#block_connection_requests'


  #EVENTS ROUTES

  # for creating an event
  post '/api/v1/events', to: 'api/v1/events#create'
  # get event by Id
  get '/api/v1/events/:id', to: 'api/v1/events#show'
  # get all upcoming events
  get '/api/v1/events', to: 'api/v1/events#index'
  #get all events made by a user
  get '/api/v1/events/user/:user_id', to: 'api/v1/events#my_events'


  #Post ROUTES

  #for creating a post
  post '/api/v1/posts', to: 'api/v1/posts#create'
  post '/api/v1/posts/event', to: 'api/v1/posts#event_post'

  #GUESTS ROUTES

  #for creating a guest for a event
  post '/api/v1/guests', to: 'api/v1/guests#create'
  delete '/api/v1/guests/:id', to: 'api/v1/guests#destroy'

  #NOTIFICATION ROUTES
  # post '/api/v1/notifications', to: 'api/v1/notifications#create_notification'
  #For getting user notifications
  get '/api/v1/notifications', to: 'api/v1/notifications#get_notifications'




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
