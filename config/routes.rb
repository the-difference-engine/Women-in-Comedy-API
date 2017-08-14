Rails.application.routes.draw do
  devise_for :users
  #devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/users/feed/', to: 'users#fetch_user_feed'
  get '/api/v1/users/connections/:id', to: 'api/v1/connection_requests#get_connections'
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
