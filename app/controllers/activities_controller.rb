class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    # Get all activities: /activities
    def index
        activities = Activity.all
        render json: activities 
    end

    # Get a specific activity: activities/:id
    def show 
        activity = Activity.find(params[:id])
        render json: activity
    end

    # Post a new activity: /activities
    def create
        activity = Activity.create(activity_params) 
        render json: activity, status: :created
    end

    # Patch a activity: /activity/:id
    def update
        activity = Activity.find_by(id: params[:id])
        activity.update(activity_params)
        render json: activity
    end
    
    # Destroy a activity: /activity/:id
    def destroy
        activity = Activity.find_by(id: params[:id])
        activity.destroy
        head :no_content
    end

    private
    
    def activity_params
        params.permit(:name, :date, :location)
    end
    
    def render_not_found_response
        render json: { error: 'activity not found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
