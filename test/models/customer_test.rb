require "test_helper"

describe Customer do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end
  
  describe "relations" do
    it "has a list of rentals" do
      princess_bride = movies(:bride)
      swamp_thing = movies(:swamp)
      customer = customers(:one)
      
      _(customer).must_respond_to :rentals
      customer.rentals.each do |rental|
        _(rental).must_be_kind_of Rental
      end
    end
  end
  
  describe "validations" do
    # it "requires a username" do
    #   user = User.new
    #   user.valid?.must_equal false
    #   user.errors.messages.must_include :username
    # end
    
    # it "requires a unique username" do
    #   username = "test username"
    #   user1 = User.new(username: username)
    
    #   # This must go through, so we use create!
    #   user1.save!
    
    #   user2 = User.new(username: username)
    #   result = user2.save
    #   result.must_equal false
    #   user2.errors.messages.must_include :username
    # end
  end
end
