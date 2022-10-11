class CartsController < ApplicationController

    before_action :authorize

    def add_to_cart
        shoe = Shoe.find(params[:shoe])
        if shoe
            if shoe.qty < 1
                out_of_stock
            else
                if shoe.qty < params[:qty].to_i
                    limited_stock(shoe, params[:qty])
                else
                    user = User.find(uid)
                    if user.valid?
                        cart = user.carts.create(
                        shoe_id: shoe.id,
                        qty: params[:qty],
                        active: true
                        )
                        return app_response(status_code: 201, body: cart, serializer: CartSerializer)
                    else
                        return app_response(message:"You are not authorized!", status_code: 401)
                    end
                end
            end
            else
                invalid_shoe
        end
    end

    def update_cart
    end

    def delete_from_cart
       Cart.destroy_by(id: params[:cart_id])
       app_response(message: "Deleted item from cart") 
    end

    def clear_cart
        Cart.destroy_by(user_id: uid)
        app_response(message: "You have cleared your cart")
    end

    # Retrieve cart items for the user
    def show_cart
       cart_items = User.find(uid).carts.filter {|item| item.active}.map { |item| ActiveModelSerializers::SerializableResource.new(item, serializer: CartSerializer) }
       app_response(body: cart_items)
    end

    private

    def out_of_stock
        app_response(message: "The item is out of stock at this time")
    end

    def limited_stock(shoe, qty)
        app_response(message: "Failed to order #{qty} shoe(s). There are only #{shoe.qty} in stock")
    end

    def invalid_shoe
        not_found(message: "That does not seem to be a valid shoe")
    end

end
