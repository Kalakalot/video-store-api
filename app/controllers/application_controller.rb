class ApplicationController < ActionController::API
    def zomg
        render :json => "It works!", status: :ok
    end

end
