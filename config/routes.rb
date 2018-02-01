Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"

  post "/users" => "users#create"

  get "/orders" => 'orders#index'
  post "/orders" => "orders#create"

  get "/categories/:id" => "categories#show"

end
