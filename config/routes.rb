Rails.application.routes.draw do
  devise_for :users
  root "wordbooks#index"
  resources :wordbooks do
    resources :words
  end
  resources :users, only: [:show]
end
