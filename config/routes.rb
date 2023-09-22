Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  root "blog_posts#index"
  resources :blog_posts

  get "users/login", to: "sessions#new"
  post "users", to: "sessions#create"
  delete "users/logout", to: "sessions#destroy"

  match "*path", to: "blog_posts#index", via: :all
end
