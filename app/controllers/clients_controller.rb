class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :client_not_found

    def show
        client = Client.find(params[:id])
        render json: client, serializer: ClientChargeSerializer
    end

    def create
        client = Client.create(client_params)
        render json: client, status: :created
    end

    private 

    def client_params
        params.permit(:name, :age)
    end

    def client_not_found
        render json: {error: "Client not found"}, status: :not_found
    end

end
