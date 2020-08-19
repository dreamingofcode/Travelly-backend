Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      get '/api/v1/users', to: 'users#index'
      # get '/api/v1/users/:id' to:'users#destroy'
      post '/api/v1/users', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/current_user', to: 'auth#show'
    end
  end
end
