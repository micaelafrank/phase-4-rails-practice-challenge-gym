class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :gym_not_found

    def show
        gym = find_gym 
        render json: gym 
    end

    def destroy
        gym = find_gym 
        gym.destroy
        head :no_content
    end

    def create
        gym = Gym.create(gym_params)
        render json: gym, status: :created
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end

    def gym_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end

end
