Rails.application.routes.draw do
  root to: "home#index"
  resources :home, only: [:create]
end
