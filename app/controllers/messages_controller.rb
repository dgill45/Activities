class MessagesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    # Get all messages: /messages
    def index
        messages = Message.all
        render json: messages 
    end

    # Get a specific message: messages/:id
    def show 
        message = Message.find(params[:id])
        render json: message
    end

    # Post a new message: /message
    def create
        message = Message.create(message_params) 
        render json: message, status: :created
    end

    # Patch a message: /message/:id
    def update
        message = Message.find_by(id: params[:id])
        message.update(message_params)
        render json: message
    end
    
    # Destroy a message: /message/:id
    def destroy
        message = Message.find_by(id: params[:id])
        message.destroy
        head :no_content
    end

    private
    
    def message_params
        params.permit(:author, :content)
    end
    
    def render_not_found_response
        render json: { error: 'message not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
