

class ApplicationController < ActionController::API

  def welcome
    @all = Store.all
    render json: {stores:@all}

    # render json: {username: "jacob ", password: " dsjfskjdfs "}
  end



end
