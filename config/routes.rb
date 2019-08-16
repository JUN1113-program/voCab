Rails.application.routes.draw do
  devise_for :users
  root "wordbook#index"
  resources :wordbook, only: :index
end
