class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :cant_validate_membership

    def create 
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def cant_validate_membership(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
