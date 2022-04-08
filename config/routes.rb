Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end  
  
  namespace :api do
    post 'authenticate', to: 'authentication#login'
  end
  # Defines the root path route ("/")
  root 'users#index'
end
