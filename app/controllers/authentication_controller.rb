class AuthenticationController < ApplicationController

    def create_account
        user = User.create(create_params)
        if user.valid?
            create_user_session(user.id, user.user_type)
            app_response(status_code: 201, message: "Account created successfully", body: user)
        else
            app_response(status_code: 422, message: "Invalid input", body: user.errors.full_messages)
        end
    end

    def login_account
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            create_user_session(user.id, user.user_type)
            app_response(status_code: 200, message: "Login successful", body: user, serializer: UserSerializer)
        else
            app_response(status_code: 401, message: "Invalid username or password")
        end
    end

    def logout_account
        delete_user_session
        app_response(status_code: 200, message: "Log out successfully")
    end
    
    private

    def create_params
        params.permit(:name, :email, :password, :display_picture, :user_type)
    end

    def create_user_session user_id, user_type
        session[:user_id] ||= user_id
        session[:user_type] ||= user_type
    end

    def delete_user_session
        session.delete :user_id
        session.delete :user_type
    end

end
