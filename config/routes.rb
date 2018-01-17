Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/all_products" => "products#all_products"
  get "/blue_yeti" => "products#blue_yeti"
  get "/seiko_watch" => "products#seiko_watch"

end
