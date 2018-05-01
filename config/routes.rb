Rails.application.routes.draw do
  devise_for :users, :class_name => "User", controllers: {sessions: 'api/v1/sessions'}, skip: :sessions

  #devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #MEET OPTION ROUTES
  get 'api/v1/meet_options', to: 'api/v1/meet_options#index'

  #USERS DATA ROUTES
  get 'api/v1/sessions/sign_out', to: 'api/v1/sessions#destroy'


  post 'api/v1/resend_confirmation_instructions', to: 'api/v1/users#resend_confirmation_instructions'



  #for getting users info when they login
  get '/api/v1/users/info', to: 'api/v1/users#fetch_user_info'
  #for getting users feed
  get '/api/v1/users/feed', to: 'api/v1/users#fetch_user_feed'

  #Suspension
  post '/api/v1/users/suspend' => 'api/v1/users#suspend'
  post '/api/v1/users/unsuspend' => 'api/v1/users#unsuspend'

  # config/routes.rb
  mount ActionCable.server => '/cable'


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


  #for blocking a user
  post '/api/v1/users/blocks/:id', to: 'api/v1/user_blocks#create' 
  #for getting users blocked
  get '/api/v1/users/blocked', to: 'api/v1/user_blocks#get_blocked_users'
  #for getting users blocked by
  get '/api/v1/users/blockedby', to: 'api/v1/user_blocks#get_blocked_by'
  #for deleting user blocks
  delete '/api/v1/users/blocks/:id', to: 'api/v1/user_blocks#destroy'


  #EVENTS ROUTES

  # for creating an event
  post '/api/v1/events', to: 'api/v1/events#create'
  # get event by Id
  get '/api/v1/events/:id', to: 'api/v1/events#show'
  # get all upcoming events
  get '/api/v1/events', to: 'api/v1/events#index'
  #get all events made by a user
  get '/api/v1/events/user/:user_id', to: 'api/v1/events#my_events'
  # edit an existing event
  post '/api/v1/events/:id', to: 'api/v1/events#update'


  #Post ROUTES

  #for creating a post
  post '/api/v1/posts', to: 'api/v1/posts#create'
  post '/api/v1/posts/event', to: 'api/v1/posts#event_post'

  #GUESTS ROUTES

  #for creating a guest for a event
  post '/api/v1/guests', to: 'api/v1/guests#create'
  delete '/api/v1/guests/:id', to: 'api/v1/guests#destroy'

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

  post '/api/v1/users/suspend' => 'api/v1/users#suspend'
  post '/api/v1/users/unsuspend' => 'api/v1/users#unsuspend'

end
