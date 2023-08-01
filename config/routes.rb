Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      get "/bills", to: "bills#index"
      get "/bills/:id", to: "bills#show"

      resources :categories, only: [:index, :show, :new, :create, :update]

      post '/user_categories', to: 'user_categories#create'
      delete '/user_categories', to: 'user_categories#destroy'

      get '/user_bills', to: 'user_bills#index'
      post '/user_bills', to: 'user_bills#create'
      delete '/user_bills', to: 'user_bills#destroy'
    end
  end
end
