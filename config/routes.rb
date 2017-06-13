Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  root to: "pages#home"
  get "/statistics" => "pages#statistics"
  get "/about" => "pages#about"
  get "/news" => "pages#news"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  resources :users
  resources :products
  resources :carts
  resources :line_items
  resources :orders
  resources :categories
end
