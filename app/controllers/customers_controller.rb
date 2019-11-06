class CustomersController < ApplicationController
    KEYS = [:id, :name, :register_at, :address, :city, :state, :postal_code, :phone]
    def index
        customers = Customer.all.as_json(only: KEYS)
        render json: customers, status: :ok
        # customers = customer.all.as_json(only: [:id, :name, :register_at, :address, :city, :state, :postal_code, :phone])
        # render json: customer, status: :ok
        # render json: { ready_for_lunch: "yassss" }, status: :ok
    end
 
    
    

    private

    def customer_params
        params.require(:customer).permit(:id, :name, :register_at, :address, :city, :state, :postal_code, :phone)
    end

end
