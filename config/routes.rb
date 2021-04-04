Rails.application.routes.draw do

  root "static_pages#home"
  get '/privacy-policy', to: 'static_pages#policy'
  get '/terms', to: 'static_pages#terms'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
