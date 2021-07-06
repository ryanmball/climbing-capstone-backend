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
  
  # Data for filters & dropdowns
  get "/grades" => "records#grades"
  get "/partners" => "records#partners"
  get "/crags" => "records#crags"
  get "/areas" => "records#areas"
  get "/collections" => "records#collections"

  # Data for graphs
  get "/grades_all" => "records#grades_graph_all"
  get "/grades_sent" => "records#grades_graph_sent"
  get "/days_per_month" => "records#days_per_month"
  get "/days_per_year" => "records#days_per_year"
  
  get "/collections" => "collections#index"
  post "/collections" => "collections#create"
  get "/collections/:id" => "collections#show"
  patch "/collections/:id" => "collections#update"
  delete "/collections/:id" => "collections#destroy"

  get "/routes" => "routes#index"

  post "/images" => "images#create"
  delete "/images/:id" => "images#destroy"
end
