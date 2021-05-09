Rails.application.routes.draw do

  root "static_pages#home"
  get "/privacy-policy", to: "static_pages#policy"
  get "/terms", to: "static_pages#terms"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, only: [:create, :show]
  resources :letters do
    collection do
      get "random"
    end
  end
  resources :letters, only: [:create, :show, :destroy]
end
