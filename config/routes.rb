Rails.application.routes.draw do
  devise_for :users
  root "wordbooks#index"
  resources :wordbooks
end
