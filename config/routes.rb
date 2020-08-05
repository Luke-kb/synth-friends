Rails.application.routes.draw do
  resources :loans
  resources :categories
  resources :brands
  resources :listings
  resources :ratings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root 'home#page'
  devise_for :users
  resources :profiles
  resources :users, only: [:show]
  get 'search', to: "listings#search"
end
