class RentalsController < ApplicationController
    
    def checkout
        customer_id = params[:customer_id]
        movie_id = params[:movie_id]

        customer = Customer.find_by(id: customer_id)
        movie = Movie.find_by(id: movie_id)

        if movie.nil? || customer.nil?
            render_error("Sorry, no record found for this movie or customer!")
            return

    
        end
        

        movies_available = movie.available_inventory 
        if movies_available > 0 && movies_available <= movie.inventory
            rental = Rental.new(customer_id: customer_id, movie_id: movie_id)
            movie.rentals << rental
            movie.available_inventory = movies_available - 1
            movie.save
            
            customer.rentals << rental
            customer.movies_checked_out_count += 1
            customer.save
        else
            render_error("Sorry, '#{movie.title}' has no copies available to rent")
        end
        
        render json: movie, status: :ok
    end
    
    
    def checkin
        customer_id = params[:customer_id]
        movie_id = params[:movie_id]
        
        customer = Customer.find_by(id: customer_id)
        movie = Movie.find_by(id: movie_id)
        
        if movie.nil? || customer.nil?
            render_error("Sorry, no record found for this movie or customer!")
            return
        end
        
        movies_available = movie.available_inventory 
        if movies_available < movie.inventory
            rental = Rental.new(created_at: Time.now, customer_id: customer_id, movie_id: movie_id)
            movie.rentals.delete(rental)
            movie.available_inventory = movies_available + 1
            movie.save!
            
            customer.rentals.delete(rental)
            customer.movies_checked_out_count -= 1
            customer.save!
        else
            render_error
        end
        
        render json: movie, status: :ok
    end
    
    private 
    
    def rentals_params
        params.require(:rentals).permit(:customer_id, :movie_id)
    end
    
    def render_error(message)
        render json: {
            ok: false,
            errors: message
            }, status: :bad_request
    end
end

    
    