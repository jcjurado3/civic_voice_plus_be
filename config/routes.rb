Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      get "/bills", to: "bills#index"
      get "/bills/:id", to: "bills#show"
      get "/members", to: "members#index"
      get "/members/:id", to: "members#show"
    end
  end
end
