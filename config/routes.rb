Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#page'
  devise_for :users 
  resources :users, only: [:show]
  resources :profiles
  resources :listings
  get '/user_listings/:id/', to: 'listings#user_listings', as: 'user_listings'
  resources :categories
  resources :brands
  resources :loans
  resources :ratings
  
  get 'search', to: "listings#search"
end
