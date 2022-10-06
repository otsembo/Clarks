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

end
