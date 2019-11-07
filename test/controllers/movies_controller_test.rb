require "test_helper"

MOVIE_FIELDS = %w(id title overview release_date inventory available_inventory).sort

describe MoviesController do
  
  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end

  describe "index" do
    it "responds with JSON and success" do
      # Act
      get movies_path

      # Assert
      check_response(expected_type: Array)
    end

    it "responds with an array of movie hashes" do
      # Act
      get movies_path

      # Assert
      body = check_response(expected_type: Array)

      body.each do |movie|
        expect(movie.keys.sort).must_equal MOVIE_FIELDS
      end
    end

    it "will respond with an empty array when there are no movie" do
      # Arrange
      Movie.destroy_all

      # Act
      get movies_path

      # Assert
      body = check_response(expected_type: Array)
      expect(body).must_equal []
    end
  end

  # describe "show" do

  #   it "retrieves one movie"
   
  #   get movies_path

  #   check_response(expected_type: Hashes)

  #   end

  describe "show" do
    it "retrieves one movie" do
      # Arrange
      movie = Movie.first

      # Act
      get movie_path(movie)
      body = JSON.parse(response.body)

      # Assert
      must_respond_with :success
      expect(response.header['Content-Type']).must_include 'json'
      expect(body).must_be_instance_of Hash
      expect(body.keys.sort).must_equal MOVIE_FIELDS
    end

    it "sends back not found if the MOVIE does not exist" do
      # Act
      get movie_path(-1)

      body = JSON.parse(response.body)

      # Assert
      must_respond_with :not_found
      expect(response.header['Content-Type']).must_include 'json'
      expect(body).must_be_instance_of Hash
      expect(body.keys).must_include "errors"
    end
  end

  describe 'create' do

    before do
      # Create valid request
      @movie = {
        bride: {
          title: "The Princess Bride",
          overview: "A unique fairytale with adventure, drama, romance, and swordfighting",
          release_date:  "Fri, 05 Nov 2010",
          inventory: "25",
          available_inventory: "25",
          created_at: "Tue, 05 Nov 2019 22:59:38 UTC +00:00",
          updated_at: "Tue, 05 Nov 2019 22:59:38 UTC +00:00"
        }
      }

    it 'responds with created status when request is good' do
      # make post request to create
      # verify count +1
      expect{post movies, params: @movie}.must_differ 'Movie.count', 1
      # check for created code
      must_respond_with :created
      # body contains new movie's id
      body = JSON.parse(response.body)
      expect(body.keys).must_equal ['id']
    end

    it 'responds with bad_request when request has no name' do
      # make bad request
      no_title_movie = @movie
      no_title_movie[:title] = nil
      # call
      # verify count doesn't change
      expect{post movies_path, params: @movie}.wont_change 'Movie.count'
      # verify bad_request status
      must_respond_with :bad_request
      # body contains errors which contain string 'name'
      body = JSON.parse(response.body)
      expect(body['errors'].keys).must_include 'title'
    end
  end
end
end
