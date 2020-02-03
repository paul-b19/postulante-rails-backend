Rails.application.routes.draw do
  resources :bodies
  resources :attribs
  resources :requests
  resources :collections
  resources :users


  post "/signup", to: "users#create"
end
