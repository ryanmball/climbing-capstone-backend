Rails.application.routes.draw do
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/records" => "records#index"
  post "/records" => "records#create"
  get "/records/:id" => "records#show"
  patch "/records/:id" => "records#update"
  delete "/records/:id" => "records#destroy"

  get "/collections" => "collections#index"
  post "/collections" => "collections#create"
  get "/collections/:id" => "collections#show"
  patch "/collections/:id" => "collections#update"
  delete "/collections/:id" => "collections#destroy"

  get "/routes" => "routes#index"

  post "/images" => "images#create"
  delete "/images/:id" => "images#destroy"
end
