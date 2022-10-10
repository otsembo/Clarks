class ShoesController < ApplicationController

    before_action :authorize
    before_action :authorize_potential_seller
    skip_before_action :authorize_potential_seller, only: [:list_shoes]

    # CRUD Ops for shoes

    def create_shoe
        user = User.find(session[:user_id])
        app_response(status_code: 401, message: "You do not have permission to add a shoe to the store") unless user.valid?
            shoe = user.shoes.create(shoe_params)
            app_response(status_code: 201, message: "Created successfully", body: shoe, serializer: ShoeSerializer)
    end

    def list_shoes
        shoes = Shoe.all
        app_response(status_code: 200, body: shoes)
    end

    def update_shoe
       shoe = Shoe.find(params[:shoe_id])
       shoe_not_found() unless shoe.valid?
            shoe.update(shoe_params)
            app_response(status_code: 200, message: "Updated successfully", body: shoe, serializer: ShoeSerializer)
    end

    def delete_shoe
        shoe = Shoe.find(params[:shoe_id])
        shoe_not_found() unless shoe.valid?
             shoe.destroy
             app_response(status_code: 200, message: "Deleted successfully")
    end

    private

    def shoe_params
        params.permit(:name, :qty, :size, :price, :color, :user_id, :description)
    end

    def shoe_not_found
        not_found("That does not seem to be a valid shoe")
    end

end
