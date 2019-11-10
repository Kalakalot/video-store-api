require "test_helper"

describe Rental do
  
  describe "relationships" do
    
  end
  
  describe "validations" do 
    it "creates a rental if customer id, movie id, and due date are provided" do
      
      movie = movies(:harry)
      customer = customers(:three)
      
      expect{
        Rental.create(movie_id: movie.id, customer_id: customer.id, due_date: Date.today + 7)
      }.must_differ "Rental.count", 1
      
    end
    
    it "won't creat4e a rental if customer id, movie id, and due date are missing" do
      
    end
  end
end
  