Rails.application.routes.draw do
  post "/users" => "users#create"

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
end
