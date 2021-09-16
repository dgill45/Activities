class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # Get all activities: /activities
    def index
        activity = Activity.all
        render json: activity 
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
end
