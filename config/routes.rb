Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end  
  

  # Defines the root path route ("/")
  root 'users#index'
end
