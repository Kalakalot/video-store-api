class CustomersController < ApplicationController
    KEYS = [:id, :name, :registered_at, :address, :city, :state, :postal_code, :phone, :movies_checked_out_count]
    def index
        customers = Customer.all.as_json(only: KEYS)
        render json: customers, status: :ok
    end
    
    
    private
    
    def customer_params
        params.require(:customer).permit(:id, :name, :registered_at, :address, :city, :state, :postal_code, :phone, :movies_checked_out_count)
    end
    
end
