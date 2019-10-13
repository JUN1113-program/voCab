Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  root "wordbooks#index"
  resources :wordbooks do
    resources :words, except: [:show]
    namespace :api do
      resources :words, only: [:index], defaults: { format: 'json' }
    end
    resources :tests do
      resources :testresults, only: :create
    end
  end
  namespace :api do
    resources :wordbooks, only: [:update,:destroy], defaults: { format: 'json' }
  end
  resources :users, only: [:show] do
    resources :testresults, only: [:index,:show]
    namespace :api do
      resources :testresults, only: [:index,:new], defaults: { format: 'json' }
    end
  end
  resources :admins, only:[:index, :destroy]
end