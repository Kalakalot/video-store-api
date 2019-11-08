require "test_helper"
# require "pry-rails"

# Minitest::Reporters.use!(
#   Minitest::Reporters::SpecReporter.new,
#   ENV,
#   Minitest.backtrace_filter
# )

describe RentalsController do
  
  
  describe "check out" do
    
    it "succeeds for an existing movie and customer" do
      params = 
      {
        movie_id: movies(:bride).id,
        customer_id: customers(:one).id
      }
      
      expect{
        post checkout_path(params)
      }.must_differ "Rental.count", 1
      must_respond_with :success
      
    end
    
    it "responds with bad request for invalid data" do
      bogus_rental = 
      {
        movie_id: 0,
        customer_id: -99
      }
      
      expect {
        post checkout_path(bogus_rental)
      }.wont_change "Rental.count"
      
      must_respond_with :bad_request
      
      # expect(response.header['Content-Type']).must_include 'json'
      # # expect(body["errors"]).must_include "id"
      
    end
    
    it "responds with bad request for movie with no available inventory" do 
      
    end
    
  end
  
  
  describe "check in" do
    
    it "succeeds for an existing movie and customer" do
      
    end
    
    it "responds with bad request for a bogus movie and customer" do
      
    end
    
    it "responds with bad request for a bogus customer" do
      
    end
    
    
  end
  
  
end
