class RentalsController < ApplicationController
  
def check_out


end

def check_in


end

private
def rental_params
params.require(:rental).permit(:customer_id, :movie_id)
end
