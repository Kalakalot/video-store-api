class MoviesController < ApplicationController
  KEYS = [:id, :name, :registered_at, :postal_code, :phone]
  
  def index
    movies = Movie.all
    render :json => movies.as_json(only: KEYS), status: :ok
  end
  
  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render :json => movie.as_json(only: KEYS) #status: :ok
      return
    else
      render json: {"errors" =>["not found"]}, status: :not_found
      # we need to specify response for "not found", otherwise Rails will just return default response of success
      # we can use the errors key for future error messages 
      return
    end
  end
  
  private
  def movie_params
    params.require(:movie).permit(:id, :name, :registered_at, :postal_code, :phone)
  end
end
