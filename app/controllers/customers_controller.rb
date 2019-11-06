class CustomersController < ApplicationController
    def index
        @pets = Pet.all
        # pets = Pet.all.as_json(only: [:name, :age, :human])
        # render json: pets, status: :ok
        # render json: { ready_for_lunch: "yassss" }, status: :ok
    end
    
    def show
    pet = Pet.find_by(id: params[:id]).as_json(only: [:name, :age, :human])
    render json: pet, status: :ok
    # render json: { ready_for_lunch: "yassss" }, status: :ok
    end

    
    

    private

    def pet_params
        params.require(:pet).permit(:name, :age, :human)
    end

end
