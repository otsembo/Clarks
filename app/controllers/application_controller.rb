class ApplicationController < ActionController::API
    include ActionController::Cookies

    wrap_parameters format: []

    # application response body
    def app_response(status_code: 200, message: "Success", body: nil, serializer: nil)
        if serializer
            render json: { 
                status: status_code, 
                message: message, 
                body: ActiveModelSerializers::SerializableResource.new(body, serializer: serializer) 
            },status: status_code
        else
            render json: { 
                status: status_code, 
                message: message, 
                body: body 
            },status: status_code
        end
    end

    def authorize
        return app_response(status_code: 401, message: "You are unauthorized to view this page") unless session.include? :user_id
    end

    def authorize_potential_seller
        return app_response(status_code: 401, message: "You cannot perform that action") unless session[:user_type] == "seller" || session[:user_type] == "admin"
    end

    def not_found(message: "Not found")
        return app_response(status_code: 404, message: message)
    end

    def uid
        session[:user_id]
    end

end
