Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/all_products_path", controller: "products", action: "all_products_method"
  get "/single_product/:name" => "products#single_product"
end
