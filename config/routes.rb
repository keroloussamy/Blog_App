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
    resources :users, only: [:create, :index, :show] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:index, :create]
      end
    end
  end
  # Defines the root path route ("/")
  root 'users#index'
end
