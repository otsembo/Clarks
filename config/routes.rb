Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # GENERAL APPLICATION DATA
  # ROUTES NOT FOUND
  match '/404', via: [:delete, :post, :get, :put, :patch], to: "authentication#not_found"

  # AUTHENTICATION
  post '/auth/register', to: "authentication#create_account"
  post '/auth/login', to: "authentication#login_account"
  delete '/auth/logout', to: "authentication#logout_account"

  # SHOES
  post '/shoes/create', to: "shoes#create_shoe"
  get '/shoes', to: "shoes#list_shoes"
  put '/shoes/:shoe_id/update', to: "shoes#update_shoe"
  delete '/shoes/:shoe_id/destroy', to: "shoes#delete_shoe"

  # CART
  get '/carts', to: "carts#show_cart"
  post '/carts/add', to: "carts#add_to_cart"
  delete '/carts/:cart_id/destroy', to: "carts#delete_from_cart"
  delete '/carts/destroy/all', to: "carts#clear_cart"

  # ORDER
  post '/orders/create', to: "orders#make_order"
  get '/orders/list', to: "orders#show_orders"
  get '/orders/filter/:order_status', to: "orders#filter_orders_with_status" # FILTER USER ORDERS WITH STATUS
  put '/orders/:order_id/update/:order_status', to: "orders#update_order_status" # UPDATE ORDER STATUS OF A GIVEN ORDER

end
