Rails.application.routes.draw do

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

end
