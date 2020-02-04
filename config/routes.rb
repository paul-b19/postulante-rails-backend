Rails.application.routes.draw do
  resources :bodies
  resources :attribs
  resources :requests
  resources :collections
  resources :users


  get "/users/:id", to: "users#show"
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
end
