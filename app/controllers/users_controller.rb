class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # Get all users: /users
    def index
        users = User.all
        render json: users  
    end

    # Get a particular user: /user/:id
    def show 
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else 
            render {error: "Not authorized"}, status: :unauthorized
        end
    end

    # Post a new user: /users
    def create
        user = User.create(user_params) 
        render json: user, status: :created
    end

    # Patch a user: /user/:id
    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
        render json: user
    end
    
    # Destroy a user: /user/:id
    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end

    private
    
    def user_params
        params.permit(:username, :email)
    end
    
    def render_not_found_response
        render json: { error: 'User not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
