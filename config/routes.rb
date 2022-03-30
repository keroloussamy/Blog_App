Rails.application.routes.draw do
  resources :users do
    resources :posts
  end  
  

  # Defines the root path route ("/")
  root 'users#index'
end
