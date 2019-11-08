require "test_helper"
# require "pry-rails"

describe RentalsController do
  
  describe "check out" do
    it "succeeds for an existing movie" do
      rental_params = 
      {
        movie_id: movies(:bride).id, 
        customer_id: customers(:one).id
      }
      
      # expect{
      #   post checkout_path(rental_params)
      # }.must_differ "Rental.count", 1
      # must_respond_with :success

    end
    
    it "will respond with bad request for invalid data" do
      # bogus_rental = 
      # {
      #     movie_id: 0,
      #     customer_id: -99
      # }
      
      # expect {
      # post checkout_path(bogus_rental)
      # }.wont_change "Rental.count"
      
      # must_respond_with :bad_request
      
    end

    it "will respond with bad for movie with no available inventory" do 

    end
    
  end
  
  
  describe "check in" do
    
    it "success for an existing movie" do
      
    end
    
    it "returns not found for a bogus movie" do
      
    end
    
    it "returns not found for a bogus customer" do
      
    end
    
    
  end
  
  
end
