require "test_helper"

describe RentalsController do
  
  describe "check out" do
    it "can correctly check out an existing movie" do
      movie = Movie.first
      
      expect{
        patch checkout_path, params: movie.id
      }.must_differ movie.available_inventory, 1
      
    end
    
    it "returns not found for a bogus movie" do
      
    end
    
    it "returns not found for a bogus customer" do
      
    end
    
  end
  
  
  describe "check in" do
    
    it "can correctly check in an existing movie" do
      movie = Movie.first
      
      expect{
        patch checkout_path, params: movie.id
      }.must_differ movie.available_inventory, 1
      
    end
    
    it "returns not found for a bogus movie" do
      
    end
    
    it "returns not found for a bogus customer" do
      
    end
    
    
  end
  
  
  
  
  
end
