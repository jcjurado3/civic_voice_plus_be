Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "/"

  namespace :api do
    namespace :v1 do
      get "/bills", to: "bills#index"
      get "/bills/:id", to: "bills#show"

      resources :categories, only: [:index, :show, :new, :create, :update]
      resources :states, only: [:index]

      get '/user_categories', to: 'user_categories#index'
      post '/user_categories', to: 'user_categories#create'
      delete '/user_categories', to: 'user_categories#destroy'

      get '/user_bills', to: 'user_bills#index'
      post '/user_bills', to: 'user_bills#create'
      delete '/user_bills', to: 'user_bills#destroy'

      get '/user_states', to: 'user_states#index'
      post '/user_states', to: 'user_states#create'
    end
  end
end
