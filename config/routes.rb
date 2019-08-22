Rails.application.routes.draw do
  devise_for :users
  root "wordbooks#index"
  resources :wordbooks do
    resources :words, except: [:show]
    resources :tests, only: :show do
      resources :testresults, only: :create
    end
  end
  resources :users, only: [:show] do
    resources :testresults, only: [:index,:show]
    namespace :api do
      resources :testresults, only: [:index,:new], defaults: { format: 'json' }
    end
  end
end