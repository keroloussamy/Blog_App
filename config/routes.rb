Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  
  

  # Defines the root path route ("/")
  root 'users#index'
end
