require "test_helper"

describe Movie do
  
  let (:movie) {movies(:bride)}
  it "can be created" do
    expect(movie.valid?).must_equal true
  end
  
  it "requires title, overview, release_date, and inventory" do
    required_fields = [:title, :overview, :release_date, :inventory]
    
    required_fields.each do |field|
      movie[field] = nil
      
      expect(movie.valid?).must_equal false
      
      movie.reload
    end
    
    # As with all Rails projects, model testing is a requirement. 
    # You should have at least one positive and one negative test case for each relation, 
    # validation, and custom function you add to your models.
  end
  
  describe "validations" do
    
    it "can be valid" do
      is_valid = users(:valid_user_with_username).valid?
      assert( is_valid )
    end
    
    it "is invalid if there is no username" do
      user = users(:invalid_user_without_username)
      is_valid = user.valid?
      refute( is_valid )
    end
    
  end
  
end
