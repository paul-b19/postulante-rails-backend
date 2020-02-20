Rails.application.routes.draw do
  # resources :bodies
  post "/bodies", to: "bodies#create"
  put "/bodies/:id", to: "bodies#update"
  delete "/bodies/:id", to: "bodies#destroy"

  # resources :attribs
  post "/attribs", to: "attribs#create"
  put "/attribs/:id", to: "attribs#update"
  delete "/attribs/:id", to: "attribs#destroy"

  # resources :requests
  get "/requests/:id", to: "requests#show"
  post "/requests", to: "requests#create"
  put "/requests/:id", to: "requests#update"

  # resources :collections
  post "/collections", to: "collections#create"
  delete "/collections/:id", to: "collections#destroy"

  # resources :users
  get "/users/:id", to: "users#show"
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
end
