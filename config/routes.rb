Rails.application.routes.draw do
  resources :bodies
  resources :attributes
  resources :requests
  resources :collections
  # resources :users


  post "/signup", to: "users#create"
end
