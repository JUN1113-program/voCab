Rails.application.routes.draw do
  devise_for :users
  root "wordbook#index"
  resources :wordbook
end
