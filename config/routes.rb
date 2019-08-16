Rails.application.routes.draw do
  root "wordbook#index"
  resources :wordbook, only: :index
end
