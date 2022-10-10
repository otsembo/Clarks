class OrdersController < ApplicationController

    def make_order
      cart_items = User.find(uid).carts
      cart_data = cart_items
      total_amount = 0
      cart_items.each do |item|
        item.active = false
        total_amount += calculate_order_amount(total_amount, Shoe.find(item.shoe_id), item)
      end

      order = Order.create(
        amount: total_amount,
        cart_data: cart_data,
        user_id: uid
      )

      app_response(status_code: 201, body: order)

    end

    private 
    
    def calculate_order_amount(total_amount, shoe, item)
        shoe.price * item.qty
    end

end
