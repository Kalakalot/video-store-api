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
    before do 
      @customer = Customer.new
    end
    
    it "requires a name and a registered_at" do
      _(@customer.valid?).must_equal false
      _(@customer.errors.messages).must_include :name
      _(@customer.errors.messages).must_include  :registered_at
    end
    
    it "requires an address, city, state, and postal code" do
      _(@customer.valid?).must_equal false
      _(@customer.errors.messages).must_include :address
      _(@customer.errors.messages).must_include :city
      _(@customer.errors.messages).must_include :state
      _(@customer.errors.messages).must_include :postal_code
    end
    
    it "requires a phone" do
      _(@customer.valid?).must_equal false
      _(@customer.errors.messages).must_include :phone
    end
    
  end
end
