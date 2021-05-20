Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/products" => "products#index"
  post "products" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "supplier#index"
  post "suppliers" => "supplier#create"
  get "/suppliers/:id" => "supplier#show"
  patch "/suppliers/:id" => "supplier#update"
  delete "/suppliers/:id" => "supplier#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

end
